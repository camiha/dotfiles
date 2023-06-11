return {
	s("-hds", {
		t({ '<br class="u-hidden-down-sm">', i(1) }),
	}, { description = "u-hidden-down-sm" }),

	s("-hum", {
		t({ '<br class="u-hidden-up-md">', i(1) }),
	}, { description = "u-hidden-up-md" }),

	s("-r", {
		t({ "{{ macro.ResponsiveImage(images, '", i(1), "')}}" }),
	}, { description = "macro.ResponsiveImage" }),

	s("-i", {
		t({ "{{ macro.Image(images,'", i(1), "')}}" }),
	}, { description = "macro.Image" }),
}
