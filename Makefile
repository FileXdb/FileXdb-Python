ifeq ($(OS), Windows_NT)
build:
	python -m pip install --upgrade build
	python -m build

clean:
	if exist "./build" rd /s /q build
	if exist "./dist" rd /s /q dist
	if exist "./filexdb.egg-info" rd /s /q filexdb.egg-info

clean-build:
	if exist "./build" rd /s /q build
	if exist "./dist" rd /s /q dist
	if exist "./filexdb.egg-info" rd /s /q filexdb.egg-info

	python -m pip install --upgrade build
	python -m build

test-release:
	python -m pip install --upgrade twine
	python -m twine upload --repository testpypi dist/*

release:
	python -m pip install --upgrade twine
	python -m twine upload dist/*



else	# Linux or MAC
build:
	python3 -m pip install --upgrade build
	python3 -m build

clean:
	rm -rf build
	rm -rf dist
	rm -rf filexdb.egg-info

clean-build:
	rm -rf build
	rm -rf dist
	rm -rf filexdb.egg-info

	python3 -m build

test-release:
	python3 -m pip install --upgrade twine
	python3 -m twine upload --repository testpypi dist/*

release:
	python3 -m pip install --upgrade twine
	python3 -m twine upload dist/*


endif