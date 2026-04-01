from pathlib import Path


def main() -> None:
	settings_path = Path.home() / "settings.txt"
	if settings_path.exists():
		target_dir = Path(settings_path.read_text(encoding="utf-8").strip())
	else:
		target_dir = Path.home()

	print("DSD LLP is ready.")
	print(f"Download directory: {target_dir}")
	if target_dir.exists():
		files = sorted(p.name for p in target_dir.iterdir())
		if files:
			print("Current files:")
			for item in files:
				print(f"- {item}")
		else:
			print("The download directory is currently empty.")
	else:
		print("The download directory does not exist yet.")


if __name__ == "__main__":
	main()
