Return-Path: <linux-doc+bounces-4630-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6148080BCED
	for <lists+linux-doc@lfdr.de>; Sun, 10 Dec 2023 21:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 966EC1C20380
	for <lists+linux-doc@lfdr.de>; Sun, 10 Dec 2023 20:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A070A18AF7;
	Sun, 10 Dec 2023 20:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="HL4fAqYk"
X-Original-To: linux-doc@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14411ED;
	Sun, 10 Dec 2023 12:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1702239893; x=1702844693; i=w_armin@gmx.de;
	bh=bcwM7hu/lcoNUcXT9dFzmhq7Supu1dDMMBv0VFimJQo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=HL4fAqYkma1u8ZKR7xX4zuocV4SBj/Kw6H//5VBdLrklAsq0VriX7YABvcuOY7XA
	 wsdNzq5i49THtS6eznSB3V1PoMcBVjXiS+rYFEmUOJyzId1NGMRul2IxR58Cpmo4U
	 wSgCn81ZwYp8yro7L7zmmxDZi6jf65AcAEK87/fMplKDiKZQWkyH+mXbQzvDRUw7T
	 X/++mmDQ3im66egR0lDtr/lGyytUTuluDIFSPa+LeFbWpfSTZkQjfazuO9JUaqawL
	 bg6PuoWMpy6vHl3QRujY1MC8/14+ZCBy/UxrQIS4N9vVSNhuG7MeIExtfcu7OrhZF
	 ekddb8gJk+Bl6dlZIg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.users.agdsn.de ([141.30.226.129]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MuDbx-1rVall3qw9-00uaqy; Sun, 10 Dec 2023 21:24:53 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	corbet@lwn.net
Cc: Dell.Client.Kernel@dell.com,
	linux-doc@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] platform/x86: dell-smbios-wmi: Use devm_get_free_pages()
Date: Sun, 10 Dec 2023 21:24:41 +0100
Message-Id: <20231210202443.646427-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231210202443.646427-1-W_Armin@gmx.de>
References: <20231210202443.646427-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BDkhbzp0Ms/xMjG+rWvrcWO0esNvAHqEEaXbO9olz0GfgKb9TNt
 Rbk9twGQV9tWEi6WzSVtYF9ar9PDyjM2P9UDz1MsLXF04ja490vPd7+gLh9D0cLtc6n87q3
 oygjGyB/uRHcDhRh2/5itNDJMkkS1tZeTDk/OP1FBi8XcvxNjaz1e90SXPuA0siLM8rcDIC
 FEV9bZeaPF5DRfn/hDTYQ==
UI-OutboundReport: notjunk:1;M01:P0:vLvsShTP23A=;RmVEsdEKKFRbmbwMkzI8si2pJzM
 S4wk2Ea46NLWGCFPHRczfqFK9q35pBrRzAdMsQnqJMJOfkVF2ReSmSTaBS7mc7guwl8i8w18A
 b8SrSPPDRtMGlOL6JI5qsa2OvIA2QY37XWRFakEheL6yA6RzffGWKbRA+DaaZ0cP4VdQggRZ5
 59XhbEgWx12+uTMP1sXrCjrLBjrpUQEVQ2IJ1rK5lUA4lhp8yL6R70qMWOqJ65aW+ouFC9cPD
 OpnB4Umn8wqsjHyT10INl900GAlaeg8a4ZuATbu6mEdVbmhpXeTLOj29iBml7NipWc3VjaPTE
 SD+5k4dbBPYJ+IIHf7YrKGc0zV2M8L0m/DarR6CMpFu2AGzClOsfcLZPW0NizToJ9mY940e0T
 A+AKBVTgPN6bEZYxOWrYrIuBDewIKZBilcSEncBZvBi0Dp8tR6oaG2Zkoq/RWYHrfVeDv558L
 i6QGzRMXe7dg3Lx6ebr1mpAckshm8fXtkCcdhYShlttdU+EgJLieUJbTWIfX21tFjiN7QOpm3
 44eVf05QrHWD0OeEug4XGVAgD/wksjBEkX4AAyD1C54J0fYHm5ms5XDhEJPTvzWEp4q9mDmdl
 4PRK9fYtsl+q47+i9BZ8MQShjiSSN1h+0pvMbmRpUkt803A5lw2vxAEobefX0qMjnLMf1iBSO
 jvI8PyrkrUAbPYVjdMMRByMt1NnpL4vckPj/A0h9Jc8LNbVIp0VFLiEoPRnRq2nhEKg0Qpk3p
 uwO8RcMSb+qlKz4lXyzNzz+6s0DWiyGTb5VlgF7DaYQ/mqR3xFmw0zB0ldiffnHcZ8vGyF2ui
 EKfy+f0ykNHgko7EhH0+QGZU4M6tSAPY6yA5+0NH73Y5CEsiQYL2mPbD6OfqdjUSvrhV5zmji
 lw4CQxm0Fse3cLrbLbieawh/oWLqWLEmmnrHBHHyOYwOM1GysCRSyNYgT1LgnhdZQnJBvQwkJ
 xJgU5eXFoVpRygfhmZgf8zsssMI=

Use devres version of __get_free_pages() to simplify the
error handling code.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/dell/dell-smbios-wmi.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/platfor=
m/x86/dell/dell-smbios-wmi.c
index 931cc50136de..7eb7c61bb27d 100644
=2D-- a/drivers/platform/x86/dell/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell/dell-smbios-wmi.c
@@ -6,6 +6,7 @@
  */
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

+#include <linux/device.h>
 #include <linux/dmi.h>
 #include <linux/list.h>
 #include <linux/module.h>
@@ -183,7 +184,7 @@ static int dell_smbios_wmi_probe(struct wmi_device *wd=
ev, const void *context)
 		return ret;

 	count =3D get_order(priv->req_buf_size);
-	priv->buf =3D (void *)__get_free_pages(GFP_KERNEL, count);
+	priv->buf =3D (void *)devm_get_free_pages(&wdev->dev, GFP_KERNEL, count)=
;
 	if (!priv->buf)
 		return -ENOMEM;

@@ -191,7 +192,7 @@ static int dell_smbios_wmi_probe(struct wmi_device *wd=
ev, const void *context)
 	wdev->dev.id =3D 1;
 	ret =3D dell_smbios_register_device(&wdev->dev, &dell_smbios_wmi_call);
 	if (ret)
-		goto fail_register;
+		return ret;

 	priv->wdev =3D wdev;
 	dev_set_drvdata(&wdev->dev, priv);
@@ -200,24 +201,17 @@ static int dell_smbios_wmi_probe(struct wmi_device *=
wdev, const void *context)
 	mutex_unlock(&list_mutex);

 	return 0;
-
-fail_register:
-	free_pages((unsigned long)priv->buf, count);
-	return ret;
 }

 static void dell_smbios_wmi_remove(struct wmi_device *wdev)
 {
 	struct wmi_smbios_priv *priv =3D dev_get_drvdata(&wdev->dev);
-	int count;

 	mutex_lock(&call_mutex);
 	mutex_lock(&list_mutex);
 	list_del(&priv->list);
 	mutex_unlock(&list_mutex);
 	dell_smbios_unregister_device(&wdev->dev);
-	count =3D get_order(priv->req_buf_size);
-	free_pages((unsigned long)priv->buf, count);
 	mutex_unlock(&call_mutex);
 }

=2D-
2.39.2


