Return-Path: <linux-doc+bounces-763-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6AF7D21AA
	for <lists+linux-doc@lfdr.de>; Sun, 22 Oct 2023 09:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88D9E28166B
	for <lists+linux-doc@lfdr.de>; Sun, 22 Oct 2023 07:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C437517E6;
	Sun, 22 Oct 2023 07:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6110A10E1
	for <linux-doc@vger.kernel.org>; Sun, 22 Oct 2023 07:44:06 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE24EDF;
	Sun, 22 Oct 2023 00:44:04 -0700 (PDT)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-57e40f0189aso1240255eaf.1;
        Sun, 22 Oct 2023 00:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697960644; x=1698565444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZsTnRg8TjGx5sy3mpYtctS4QxSmgLmOrtEZDXRWDAo=;
        b=Kmq4U9JMwAHo2htsNFjFdsrGlIzouXlPkvRWFwCNBU4ROd2hM3LEi9pPT02qkPBOFt
         WgX+sY33aseM9HMOZjfn557Kdb0WPCp9Q2pqHDVNiDFLn6lTIorkFZBsqW8TH8bqmViB
         6WSQnwGx0CrMNtpugXoy8DeMpN26n26hoNSd7kpHVckIUj1WJsNrWUPBuEUvdcp1qI/V
         C6bHPs2NAvEm08RZVD4PB5zY46u96z4A1W2bMlTywfrV7p9nSxBnCc6222bB5l+tsLEG
         FH5NSUuPXOaVHO4gLGbzC13CYz0knmtCAt5CPrsYq7P1s3MT6MjAJe6gLfT2IzA7YZMF
         MYNA==
X-Gm-Message-State: AOJu0Yy0wR533gn1gId07b92sJ7V/mQaMfDtJBuG1UKF0mqnOq9GcqJS
	rU1OZCf2VkJcyn8ZwW9AAtlHqcM8hZ8=
X-Google-Smtp-Source: AGHT+IEd3GQ2Mv1/qm2NM9cEVr4z778zSPmjvDCPvEF9ACff5C0HtwLOCL4RFc8b5m1aZtrZrt3b/Q==
X-Received: by 2002:a05:6870:6710:b0:1e9:9179:4c6f with SMTP id gb16-20020a056870671000b001e991794c6fmr8397330oab.49.1697960643911;
        Sun, 22 Oct 2023 00:44:03 -0700 (PDT)
Received: from costa-tp.redhat.com ([2a00:a040:1a3:cb84:80fa:fd2e:974a:5c42])
        by smtp.gmail.com with ESMTPSA id bz18-20020ad44c12000000b0065b29403540sm2001404qvb.127.2023.10.22.00.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 00:44:03 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>
Subject: [PATCH v2] docs: split embedded interfaces and miscellaneous
Date: Sun, 22 Oct 2023 10:43:46 +0300
Message-ID: <20231022074346.4170388-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

to make page Subsystems APIs more organized as requested

Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>

---
Changes in v2:
- removed misc from Embedded
- added group Miscellaneous

Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 Documentation/subsystem-apis.rst | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/Documentation/subsystem-apis.rst b/Documentation/subsystem-apis.rst
index 930dc23998a0..13b918fdae9b 100644
--- a/Documentation/subsystem-apis.rst
+++ b/Documentation/subsystem-apis.rst
@@ -62,18 +62,27 @@ Storage interfaces
    target/index
 
 **Fixme**: much more organizational work is needed here.
+Embedded interfaces
+-------------------
 
 .. toctree::
    :maxdepth: 1
 
-   accounting/index
-   cpu-freq/index
-   fpga/index
-   i2c/index
    iio/index
-   pcmcia/index
    spi/index
+   i2c/index
+   fpga/index
    w1/index
+
+Miscellaneous
+-------------
+
+.. toctree::
+   :maxdepth: 1
+
+   accounting/index
+   cpu-freq/index
+   pcmcia/index
    watchdog/index
    virt/index
    hwmon/index
-- 
2.41.0


