Return-Path: <linux-doc+bounces-684-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FC47D0712
	for <lists+linux-doc@lfdr.de>; Fri, 20 Oct 2023 05:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A7971F221AA
	for <lists+linux-doc@lfdr.de>; Fri, 20 Oct 2023 03:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465581FBC;
	Fri, 20 Oct 2023 03:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Gfq/Bt6R"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263871FB0
	for <linux-doc@vger.kernel.org>; Fri, 20 Oct 2023 03:42:52 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 182AAD52;
	Thu, 19 Oct 2023 20:42:50 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2804:14d:e646:872b:8302:9b9b:d59b:1681])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 438BD660734F;
	Fri, 20 Oct 2023 04:42:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697773368;
	bh=J/05EHEanGm0FKJy5r1e6byK6E7i3PXK9ybEm42W1rM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gfq/Bt6RPsw03QJinuDfXdH9ViYHkQ/YUY8Ofx6C8jRaYJoLFcQDqZUd47CDqJmB1
	 Nl0kMt+bJyMAOdfAhk6kq5JNTZGdcOyihBEEDUQfOJbZefz7I3bY2myqnt3Yx5Y/os
	 YtqBt/wHqCelxlQg1ATkNxX5lfDR9jgrb/Q5W7JAvXGm4evwwGo1oJy0dTBZ4hXpVV
	 z0sEZjNQamLCjj5Fe4/39VolCi1RXLHESJYFCgRoNxBjjyu+stX896U+rHiPB9pHLo
	 l7c+zxz4gtLXVSxDpm+AohP5u4AFNHVxg5jt5pIwFftRgSyRKFuqnHgElYhwmPDmVE
	 r0XpZh8D+RNSg==
From: Helen Koike <helen.koike@collabora.com>
To: dri-devel@lists.freedesktop.org,
	Helen Koike <helen.koike@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>
Cc: robdclark@chromium.org,
	dmitry.baryshkov@linaro.org,
	vignesh.raman@collabora.com,
	sergi.blanch.torne@collabora.com,
	guilherme.gallo@collabora.com,
	david.heidelberg@collabora.com,
	quic_abhinavk@quicinc.com,
	quic_jesszhan@quicinc.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 9/9] drm/ci: docs: add step about how to request privileges
Date: Fri, 20 Oct 2023 00:41:24 -0300
Message-Id: <20231020034124.136295-10-helen.koike@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231020034124.136295-1-helen.koike@collabora.com>
References: <20231020034124.136295-1-helen.koike@collabora.com>
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


