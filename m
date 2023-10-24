Return-Path: <linux-doc+bounces-881-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3147B7D443F
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 02:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C55D4B20CAD
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 00:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF4D10F6;
	Tue, 24 Oct 2023 00:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SL53v4wE"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2317A7E
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 00:47:13 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21CDF10F6;
	Mon, 23 Oct 2023 17:47:11 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2804:14d:e646:872b:1c98:7e30:3cb0:3153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 61ABB66072BB;
	Tue, 24 Oct 2023 01:47:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698108429;
	bh=JjLuFU0CcMqVyHW3R1fQYTrDGM4X8wmdNEPNtA5tOZs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SL53v4wEoKckYVIB1UqZHez/sM/YjFCmTUT3PZL+sERP04+cRTWTqcupRkCnHP5u3
	 9Goa+NPmiAHiEuz/hyTLXYaKt1gf9RKCT3LPjiHVkSF8NzcaWR3jclch3GXGKgfeT/
	 mBXXxpNpfU599ttTxPntHu/cr52ArtSH8rlj4B16KZR7G65IPWGonf6gOMwSKLeMgY
	 HgyKpdl2VmuMgiWRe7orXCzKd16Svp1a/Q7U1P5ARyymGlc8+wbxSt4GTKwBnGeqsv
	 q+JRDuh4755NC7MnlkfDZIsdedJfjx97EFl29KHANEq03oCb76MHjZaMgz0Eo/O5xt
	 Gyi/oiv1znZxA==
From: Helen Koike <helen.koike@collabora.com>
To: dri-devel@lists.freedesktop.org,
	Helen Koike <helen.koike@collabora.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>
Cc: robdclark@chromium.org,
	dmitry.baryshkov@linaro.org,
	vignesh.raman@collabora.com,
	sergi.blanch.torne@collabora.com,
	guilherme.gallo@collabora.com,
	david.heidelberg@collabora.com,
	quic_abhinavk@quicinc.com,
	quic_jesszhan@quicinc.com,
	daniels@collabora.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/10] drm/ci: docs: add step about how to request privileges
Date: Mon, 23 Oct 2023 21:45:25 -0300
Message-Id: <20231024004525.169002-11-helen.koike@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231024004525.169002-1-helen.koike@collabora.com>
References: <20231024004525.169002-1-helen.koike@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clarify the procedure developer must follow to request privileges to
run tests on Freedesktop gitlab CI.

This measure was added to avoid untrusted people to misuse the
infrastructure.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
Reviewed-by: David Heidelberg <david.heidelberg@collabora.com>
---

v2:
- fix typo in commit message
v3:
-no changes
---
 Documentation/gpu/automated_testing.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
index 469b6fb65c30..8ec1878b44ab 100644
--- a/Documentation/gpu/automated_testing.rst
+++ b/Documentation/gpu/automated_testing.rst
@@ -86,10 +86,13 @@ https://gitlab.freedesktop.org/janedoe/linux/-/settings/ci_cd), change the
 CI/CD configuration file from .gitlab-ci.yml to
 drivers/gpu/drm/ci/gitlab-ci.yml.
 
-3. Next time you push to this repository, you will see a CI pipeline being
+3. Request to be added to the drm/ci-ok group so that your user has the
+necessary privileges to run the CI on https://gitlab.freedesktop.org/drm/ci-ok
+
+4. Next time you push to this repository, you will see a CI pipeline being
 created (eg. https://gitlab.freedesktop.org/janedoe/linux/-/pipelines)
 
-4. The various jobs will be run and when the pipeline is finished, all jobs
+5. The various jobs will be run and when the pipeline is finished, all jobs
 should be green unless a regression has been found.
 
 
-- 
2.39.2


