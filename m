Return-Path: <linux-doc+bounces-1033-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 060C97D57EA
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 18:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36B301C20C6A
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 16:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1121438F96;
	Tue, 24 Oct 2023 16:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="S0hMed36"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346EE38BC9
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 16:20:53 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F01AFA6
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 09:20:48 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-507975d34e8so6910805e87.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 09:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1698164446; x=1698769246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zb5h6XsitjjkMwY2slc9nT1B2Witc+lbx2i0qDP2o4I=;
        b=S0hMed3694P9zPRVWALgoldTdhfq7/6zX5EQ0U2yoMj0cFf+BTBlyR2hCSsgKFlmGb
         lgFJ02TQP8tkqWj6Gx9sqUjojaJnA7JyhcVsQkOW4PD5Fcqrof4pu9j2kq+3PTWVdOgc
         B9eCJrxG8MlNuZvU/IiuQ7xTsmpHu+pCwvkP7Vl3GqONTdfcAXEte/jJBIwcClGek0Dv
         OJrc36hVJqLOp8Pu5CVIo8iThbR/oP+G4LqqKmsoBIUFk2GP0LiSlLktGHd4lkThi1N1
         1WyKfRUO9/1Ad0bg6GIMVYcyOpeVDXelAqoATmydlJPkqBlnaq+8xudsZFHq0KJDdCZQ
         21Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698164446; x=1698769246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zb5h6XsitjjkMwY2slc9nT1B2Witc+lbx2i0qDP2o4I=;
        b=hSE6gZSc+QztCkbhT8fQmj0So/LitFZ++dSmvZGDpRE2GbdmfL+JbwLcBdO3TdaPhv
         hwYWA3dQ6ym3u7Urf/szY9RXUS1uMQECLrpiiK8fxFKfsxbfan9ohxXnFQxGLi8vhkKk
         HlcMHGm1jJGVFr8jlxB706kmZl/eH35MJzMZ+UziPJbaraRI0G2q06gT4m63xydpk2IT
         sjzL2J/ICbj/fp24/n0cutPnoXE0ngf2+dUOlcDvZ2nHc0u2hMMGlkTPLxEJ4Zby7RGT
         DGOKvCxai8BDiRSZY5xYvouEkFMiz1OCyTn5zRDjrBX/m5vCc0qspSlSfItTWToy9woG
         6jtw==
X-Gm-Message-State: AOJu0YxCTvD1WaV10X8tO25Ilm1oujwDbCJCCkApFZkdysaQbRcQAcmg
	BiYCCyNGPrLyRq7gWbwACs/krA==
X-Google-Smtp-Source: AGHT+IF5GO0NQsmzyFbSXZfvJv0dm6w8spVGiz+FPRpRHxKN3lH3olIAiqogn1tFtRTDhJG+yKQTEA==
X-Received: by 2002:ac2:5b0f:0:b0:4f8:75cf:fdd7 with SMTP id v15-20020ac25b0f000000b004f875cffdd7mr7389094lfn.22.1698164446132;
        Tue, 24 Oct 2023 09:20:46 -0700 (PDT)
Received: from localhost (clnet-p106-198.ikbnet.co.at. [83.175.106.198])
        by smtp.gmail.com with UTF8SMTPSA id cy8-20020a0564021c8800b0054018a76825sm5333552edb.8.2023.10.24.09.20.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 09:20:45 -0700 (PDT)
From: David Gstir <david@sigma-star.at>
To: Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <jejb@linux.ibm.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: David Gstir <david@sigma-star.at>,
	Shawn Guo <shawnguo@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	sigma star Kernel Team <upstream+dcp@sigma-star.at>,
	David Howells <dhowells@redhat.com>,
	Li Yang <leoyang.li@nxp.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Tejun Heo <tj@kernel.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-security-module@vger.kernel.org
Subject: [PATCH v4 3/5] MAINTAINERS: add entry for DCP-based trusted keys
Date: Tue, 24 Oct 2023 18:20:17 +0200
Message-ID: <20231024162024.51260-4-david@sigma-star.at>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231024162024.51260-1-david@sigma-star.at>
References: <20231024162024.51260-1-david@sigma-star.at>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This covers trusted keys backed by NXP's DCP (Data Co-Processor) chip
found in smaller i.MX SoCs.

Signed-off-by: David Gstir <david@sigma-star.at>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..988d01226131 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11647,6 +11647,15 @@ S:	Maintained
 F:	include/keys/trusted_caam.h
 F:	security/keys/trusted-keys/trusted_caam.c
 
+KEYS-TRUSTED-DCP
+M:	David Gstir <david@sigma-star.at>
+R:	sigma star Kernel Team <upstream+dcp@sigma-star.at>
+L:	linux-integrity@vger.kernel.org
+L:	keyrings@vger.kernel.org
+S:	Supported
+F:	include/keys/trusted_dcp.h
+F:	security/keys/trusted-keys/trusted_dcp.c
+
 KEYS-TRUSTED-TEE
 M:	Sumit Garg <sumit.garg@linaro.org>
 L:	linux-integrity@vger.kernel.org
-- 
2.35.3


