Return-Path: <linux-doc+bounces-15909-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EF58BE3EA
	for <lists+linux-doc@lfdr.de>; Tue,  7 May 2024 15:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A23691F21F4A
	for <lists+linux-doc@lfdr.de>; Tue,  7 May 2024 13:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFD916F0CF;
	Tue,  7 May 2024 13:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1cgbs1x"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77ABE16F829;
	Tue,  7 May 2024 13:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087926; cv=none; b=rmLZodXekqYiU0s7Rn25zGxceO+cXMAmJbQaUBCJLA1ZH/qyzXpAJqjMuNvxXQphTPC7kOkpvjw9lSwdKReZ4zSf3vKcsk3act4t6RK4fuJI5yM7XgIl4xDN/FhVpSDlcJLXdwTJdIZ76ImXqksQLnEl2K1L88JIPoCAj53XP24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087926; c=relaxed/simple;
	bh=5SC8jBSEzHmgckW1BacEcaTXRBSM2iUEZbvY/yF9KWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q7GrY3vbR0FeY8R4FAlUj4uqgZkOpdBdWyoUsW91GPgeOkVBoCS3ARAL9O2Mn2l8kdkozLHuA9jSSgYZeyaf/YS/9qRCM5JxQx2OW6b1sqf3sb/CVUoPnax7Oc6EnP09QbladLmD32wO6hCrbLWa9UssGWGjoE7RZfgVHtS+Ncw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1cgbs1x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6CBAC4AF66;
	Tue,  7 May 2024 13:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715087926;
	bh=5SC8jBSEzHmgckW1BacEcaTXRBSM2iUEZbvY/yF9KWs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=M1cgbs1xsswHihdBh4A+Hu8loIKHp5QQl7S45vJ1oM1nnNChjAcp8AkWlW+n1Eraq
	 5DIQBe2e+gaC1RaHlOnWvJmfuE/edIo4G0UMc9A/5lilm5XE+Vpmv6JgjGb6XdDFVl
	 p/4bIrtE9gUXe4oz5rJbinII2wPkx3D/4d3Gby2H0Y789dFksJ1ZM/sdSAb/JmMeZE
	 0Wz17jjc4ZCJZaUct+7mQcxIk7c84bdBuiukr3j96DqBe0BZSc5EZfBINEUUIVmBiv
	 Z2vgeXdaivP3VDT26vD5DZsnQvQI/BjJN+pfsACoGIjyDZdnSN8x5k2wQze2yk4GHF
	 GOfpLL3j94xWQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 07 May 2024 15:17:40 +0200
Subject: [PATCH v13 22/28] drm/tests: Add infoframes test
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-kms-hdmi-connector-state-v13-22-8fafc5efe8be@kernel.org>
References: <20240507-kms-hdmi-connector-state-v13-0-8fafc5efe8be@kernel.org>
In-Reply-To: <20240507-kms-hdmi-connector-state-v13-0-8fafc5efe8be@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8730; i=mripard@kernel.org;
 h=from:subject:message-id; bh=5SC8jBSEzHmgckW1BacEcaTXRBSM2iUEZbvY/yF9KWs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGlWmh8Zm6bFJLPWZC0/4SItaLrH8q5sutYJ4fvbas5GO
 6qbvp3ZMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZSsoix4faVO//1+8pUH6dp
 fbt3/8WMg7ten5ZeOy/m4tprr0rP6BT/8FmnWytRsOLW2l2Sp3lv9jDWxyw0C+5/7On9N3/++bo
 9u9b4rDik889uR+Ol7BNTfL8V5Dtd5NHs6N1SEzb3hMcaYU8pAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The previous patch added the generation of the infoframes matching an
HDMI connector state. Let's add a few tests to make sure it works as
expected.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_connector_test.c | 219 +++++++++++++++++++++++++++++
 1 file changed, 219 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 4e3c2c7dfaf2..9ea228266de2 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -219,10 +219,221 @@ static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
 				       BIT(HDMI_COLORSPACE_RGB),
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
 
+/*
+ * Test that the registration of an HDMI connector with a NULL vendor
+ * fails.
+ */
+static void drm_test_connector_hdmi_init_null_vendor(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       NULL, "Product",
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
+				       8);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
+/*
+ * Test that the registration of an HDMI connector with a NULL product
+ * fails.
+ */
+static void drm_test_connector_hdmi_init_null_product(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", NULL,
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
+				       8);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
+/*
+ * Test that the registration of a connector with a valid, shorter than
+ * the max length, product name succeeds, and is stored padded with 0.
+ */
+static void drm_test_connector_hdmi_init_product_valid(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const unsigned char expected_product[DRM_CONNECTOR_HDMI_PRODUCT_LEN] = {
+		'P', 'r', 'o', 'd',
+	};
+	const char *product_name = "Prod";
+	int ret;
+
+	KUNIT_ASSERT_LT(test, strlen(product_name), DRM_CONNECTOR_HDMI_PRODUCT_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", product_name,
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
+				       8);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_MEMEQ(test,
+			   priv->connector.hdmi.product,
+			   expected_product,
+			   sizeof(priv->connector.hdmi.product));
+}
+
+/*
+ * Test that the registration of a connector with a valid, at max
+ * length, product name succeeds, and is stored padded without any
+ * trailing \0.
+ */
+static void drm_test_connector_hdmi_init_product_length_exact(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const unsigned char expected_product[DRM_CONNECTOR_HDMI_PRODUCT_LEN] = {
+		'P', 'r', 'o', 'd', 'u', 'c', 't',
+		'P', 'r', 'o', 'd', 'u', 'c', 't',
+		'P', 'r',
+	};
+	const char *product_name = "ProductProductPr";
+	int ret;
+
+	KUNIT_ASSERT_EQ(test, strlen(product_name), DRM_CONNECTOR_HDMI_PRODUCT_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", product_name,
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
+				       8);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_MEMEQ(test,
+			   priv->connector.hdmi.product,
+			   expected_product,
+			   sizeof(priv->connector.hdmi.product));
+}
+
+/*
+ * Test that the registration of a connector with a product name larger
+ * than the maximum length fails.
+ */
+static void drm_test_connector_hdmi_init_product_length_too_long(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const char *product_name = "ProductProductProduct";
+	int ret;
+
+	KUNIT_ASSERT_GT(test, strlen(product_name), DRM_CONNECTOR_HDMI_PRODUCT_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", product_name,
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
+				       8);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
+/*
+ * Test that the registration of a connector with a vendor name smaller
+ * than the maximum length succeeds, and is stored padded with zeros.
+ */
+static void drm_test_connector_hdmi_init_vendor_valid(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const char expected_vendor[DRM_CONNECTOR_HDMI_VENDOR_LEN] = {
+		'V', 'e', 'n', 'd',
+	};
+	const char *vendor_name = "Vend";
+	int ret;
+
+	KUNIT_ASSERT_LT(test, strlen(vendor_name), DRM_CONNECTOR_HDMI_VENDOR_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       vendor_name, "Product",
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
+				       8);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_MEMEQ(test,
+			   priv->connector.hdmi.vendor,
+			   expected_vendor,
+			   sizeof(priv->connector.hdmi.vendor));
+}
+
+/*
+ * Test that the registration of a connector with a vendor name at the
+ * maximum length succeeds, and is stored padded without the trailing
+ * zero.
+ */
+static void drm_test_connector_hdmi_init_vendor_length_exact(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const char expected_vendor[DRM_CONNECTOR_HDMI_VENDOR_LEN] = {
+		'V', 'e', 'n', 'd', 'o', 'r',
+		'V', 'e',
+	};
+	const char *vendor_name = "VendorVe";
+	int ret;
+
+	KUNIT_ASSERT_EQ(test, strlen(vendor_name), DRM_CONNECTOR_HDMI_VENDOR_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       vendor_name, "Product",
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
+				       8);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_MEMEQ(test,
+			   priv->connector.hdmi.vendor,
+			   expected_vendor,
+			   sizeof(priv->connector.hdmi.vendor));
+}
+
+/*
+ * Test that the registration of a connector with a vendor name larger
+ * than the maximum length fails.
+ */
+static void drm_test_connector_hdmi_init_vendor_length_too_long(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const char *vendor_name = "VendorVendor";
+	int ret;
+
+	KUNIT_ASSERT_GT(test, strlen(vendor_name), DRM_CONNECTOR_HDMI_VENDOR_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       vendor_name, "Product",
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
+				       8);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
 /*
  * Test that the registration of a connector with an invalid maximum bpc
  * count fails.
  */
 static void drm_test_connector_hdmi_init_bpc_invalid(struct kunit *test)
@@ -499,10 +710,18 @@ static struct kunit_case drmm_connector_hdmi_init_tests[] = {
 	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_invalid),
 	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_null),
 	KUNIT_CASE(drm_test_connector_hdmi_init_formats_empty),
 	KUNIT_CASE(drm_test_connector_hdmi_init_formats_no_rgb),
 	KUNIT_CASE(drm_test_connector_hdmi_init_null_ddc),
+	KUNIT_CASE(drm_test_connector_hdmi_init_null_product),
+	KUNIT_CASE(drm_test_connector_hdmi_init_null_vendor),
+	KUNIT_CASE(drm_test_connector_hdmi_init_product_length_exact),
+	KUNIT_CASE(drm_test_connector_hdmi_init_product_length_too_long),
+	KUNIT_CASE(drm_test_connector_hdmi_init_product_valid),
+	KUNIT_CASE(drm_test_connector_hdmi_init_vendor_length_exact),
+	KUNIT_CASE(drm_test_connector_hdmi_init_vendor_length_too_long),
+	KUNIT_CASE(drm_test_connector_hdmi_init_vendor_valid),
 	KUNIT_CASE_PARAM(drm_test_connector_hdmi_init_type_valid,
 			 drm_connector_hdmi_init_type_valid_gen_params),
 	KUNIT_CASE_PARAM(drm_test_connector_hdmi_init_type_invalid,
 			 drm_connector_hdmi_init_type_invalid_gen_params),
 	{ }

-- 
2.45.0


