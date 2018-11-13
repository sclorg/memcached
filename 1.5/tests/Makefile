.PHONY: test_mtf test_conu

test_mtf:
	mtf-generator
	mtf --setup --metadata

test_conu:
	pytest memcached_conu.py
