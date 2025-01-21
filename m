Return-Path: <linux-doc+bounces-35793-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F54DA17C3B
	for <lists+linux-doc@lfdr.de>; Tue, 21 Jan 2025 11:49:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BB123AA5BC
	for <lists+linux-doc@lfdr.de>; Tue, 21 Jan 2025 10:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85ED71F236B;
	Tue, 21 Jan 2025 10:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Q4bE4tj4"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDED1F1907;
	Tue, 21 Jan 2025 10:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737456503; cv=none; b=guQJLGVyPgiJdVp3zL8Rq4Tk5b4Z0vzi2sqvfP4UU2+wZExW+5L8aOFRoCQ4UxNsXfbF52FS8R5TTQi4Q7jfKMdPbqQERIF+Oih8KJ+XR3qATA+PaVUdBF9gJIS5UNOQsM39jx+SneuOrVcQZyWhEGbBUXYA31m+f+D1xSJ9zGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737456503; c=relaxed/simple;
	bh=kc2euzosF6WwxoNIeJ7ssb8bR2lSSGc/zOi8ySccSg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l+CGS0avh1wMwP439WihurG2u0qlqc3vpwR4JJ0tTPtYJo1Xg42V/MLA6DBVc/JAMsKh8to027SDMQ2Ezd6G9kQZ8jJveQUKIun9ON+Jzve95pCCsZxzoa8/5LLsNqtxgbJXyVamAYeno3z8sqeMSVleuFRykfP8QSAZX2s+gY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Q4bE4tj4; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C3871240008;
	Tue, 21 Jan 2025 10:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737456499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E23u2HV9o/J41l+eBD2531fojOe2RYdl9ZE1qpOWnRM=;
	b=Q4bE4tj4dn4D3g3EV5v9S0ca6Q1L9xe1kyPXl0JT5PMT5JmqJf92JERwOUqNyo0FfWQNDL
	63SB8sKkvYawI0Hxfwb8Th4oPiLXINEwhYY2qtfZC1cYKcNjJaeiKD35Uh1EZJNauPePI5
	U1zPfaLrTAVZ/vNLPJe3ZlyqkF4PnQWxJXUPNgov/oRBLZAF1AjN2+Ahpqr/v0CemTqIPe
	kqV/i3mWVT4Wwog9S9xMfKlgMQi7/XBVYLXiFUWPbI6wVnpLOvIsG4kW0dkNdiyW7v0dff
	Qj5fhmk5tx+08+FPKB+EQX4W0MGp2YldnlxN/cDk8RrBjbjVQMHqJS2gNFKLdQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 11:48:07 +0100
Subject: [PATCH v16 6/7] drm/vkms: Add how to run the Kunit tests
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-yuv-v16-6-a61f95a99432@bootlin.com>
References: <20250121-yuv-v16-0-a61f95a99432@bootlin.com>
In-Reply-To: <20250121-yuv-v16-0-a61f95a99432@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1171;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=XHoQP/J8cFoOO0Iqf+wQXqpq8li+aYQP7MigkGdUhFo=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj3tpS0CvEA4Q0NDtulmAH19nguxE7XcQjQvIg
 QXkKXzNAL+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ497aQAKCRAgrS7GWxAs
 4u0lD/9UoVhPx8xadvu8aiJcGf+6QHuMFvHL1PEh5gz8ltXMtPRMBgY4e+3A0eyBAhoPa1s8Wmc
 QkJo0JrE8fECbnHHCXM4T/deIFRyeZh4bJyId+uS94xHA5XPo9OzAuOjAlpcNCvPrr3N1vQ17yW
 D2UPE9IcxxObOLm5t3uvoTDMMojwOewUouOxBP/rrA0rBTMu2su7ZyxxP+q0HMtWlRFTGDYDLPm
 5ZOTZJNn7aCSnQCzAkmor1RFIS5RgKRzDk1SZMCoYJqxAmfWyjpc+Yxx08ymGmahlMjBUpyMl3G
 n5FLXY8p/9n6bBC27ZzIzNQzXb1CWDiRGy88isSp1kHVzPi8J1X4UHN7UuOD7YpV9FEptwRKhQp
 IgElRcpOWAMj5SeONXWBW9yewogWKwJrGa14ys+HqIMVWJSr6D56R4U2XMdBhV98u+mn31UFOD4
 JY7v+hFCKlynHfB7ZrWr4l+TwQ2E5UGU5ikc29tFqbs8TjtKQBsffQTRzxQ/cDV3aHI6505clTo
 l8YT4kzHGUX0oqj8YUPeo5dVDK8oD00xfr95IvGVbN5W3K2OAUMk0qDBlKNjksbaqMe+K15b67P
 9VANYE4u+eRujQ7/e8nb5TkqdvfNPQJvMlNnDo5+oojGKOfbohdaDt5TN7xsqhsGr1leb5N5V6V
 IRi6Vr/BEY51JIA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com

From: Arthur Grillo <arthurgrillo@riseup.net>

Now that we have KUnit tests, add instructions on how to run them.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/gpu/vkms.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 13b866c3617cd44043406252d3caa912c931772f..5ef5ef2e6a210382a070eaf3552bbce75b04ff0c 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -89,6 +89,17 @@ You can also run subtests if you do not want to run the entire test::
   sudo ./build/tests/kms_flip --run-subtest basic-plain-flip --device "sys:/sys/devices/platform/vkms"
   sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_flip --run-subtest basic-plain-flip
 
+Testing With KUnit
+==================
+
+KUnit (Kernel unit testing framework) provides a common framework for unit tests
+within the Linux kernel.
+More information in ../dev-tools/kunit/index.rst .
+
+To run the VKMS KUnit tests::
+
+  tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/vkms/tests
+
 TODO
 ====
 

-- 
2.47.1


