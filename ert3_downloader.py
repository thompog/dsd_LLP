import os
import pathlib
import sys
import urllib.request


URL = "https://github.com/dnSpy/dnSpy/releases/download/v6.1.8/dnSpy-net-win64.zip"
TARGET_NAME = "dnSpy-net-win64.zip"


def get_download_dir() -> pathlib.Path:
  settings_path = pathlib.Path.home() / "settings.txt"
  if settings_path.exists():
    configured = settings_path.read_text(encoding="utf-8").strip()
    if configured:
      return pathlib.Path(configured)
  return pathlib.Path(os.environ.get("LOCALAPPDATA", str(pathlib.Path.home()))) / "DSD_LLP" / "Downloads"


def main() -> int:
  download_dir = get_download_dir()
  download_dir.mkdir(parents=True, exist_ok=True)
  output_path = download_dir / TARGET_NAME

  try:
    with urllib.request.urlopen(URL, timeout=90) as response:
      data = response.read()
    output_path.write_bytes(data)
  except Exception as exc:
    print(f"Download failed: {exc}")
    return 1

  print(f"Downloaded {TARGET_NAME} to: {output_path}")
  return 0


if __name__ == "__main__":
  sys.exit(main())
