Return-Path: <linux-doc+bounces-1729-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D35717E1E02
	for <lists+linux-doc@lfdr.de>; Mon,  6 Nov 2023 11:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8696B2813E8
	for <lists+linux-doc@lfdr.de>; Mon,  6 Nov 2023 10:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A16017730;
	Mon,  6 Nov 2023 10:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LW03H6sg"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857AA1641B
	for <linux-doc@vger.kernel.org>; Mon,  6 Nov 2023 10:12:19 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0541DB;
	Mon,  6 Nov 2023 02:12:17 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6bf03b98b9bso4035346b3a.1;
        Mon, 06 Nov 2023 02:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699265537; x=1699870337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xum/W7MJuOqob9sUjPMH2NvW74OGFL5uRCJzlfRnFqQ=;
        b=LW03H6sgHkyfpHjAcahw2n3R9t66SsDMV775Kq5wJeNvccD7zee71za9UI47VE6mvD
         orl0slm6CrCeslY+qy2AiNWyQDLwa6HWOqK6G0oDTbANWqRtqro224hELfVjZhVlPpLx
         LOvZ7os9K9TxALmvkHH7PJBzpEkbs3wJF5u4q3xV3cQq2ix2+jS8AqMxULZVOZJ0sBku
         wSMeo7Pe5Cgb3migCRuwbEZi8G3mi5Rpo4sqSVSKm8sBzHUdI434AjAZ0Gje17UGZ9XE
         wdUDAqTdOUkfsfcz4PXY6FSyqUY5BGHLbtuymmK1SBF34ou1vckp1oZ1pm5fF5k/xoHC
         9j3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699265537; x=1699870337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xum/W7MJuOqob9sUjPMH2NvW74OGFL5uRCJzlfRnFqQ=;
        b=bU2nwtLvjukhLgOseHhjHLAjWVCEnqPGGnkENSarbFCfYzjmiayRV67GKH5WpW+0aZ
         25G0vlG1jMSBks5hVoOwA+tWHLlvSFmU3HKxGyi+LIMW8ePTpPTDagi1Sj8eX6iBXuzI
         HHbloofTOhLLL1jgXMCeo8oX/MD5Uwe54lQQPsfb6nCx5diGxf8OP/yiDfOoq9b2do8S
         +hfhvaFczpLvuhatUDVBIIWgPq5UGoYZ1V5I1bilC6jkHrrr+kxMvzsq7WAj5G0be2jg
         NuAlGqu9oXAFWnVnHTrxW17TYlngTXn498A5JCeiLmtc/wvr3tMXbp1MqxlEHLt/2hdd
         C0xQ==
X-Gm-Message-State: AOJu0YwQhE272Qv+PHowKdTOILpB4Aufsdp1fNuiul+wmLH8A01qSdhW
	6UXVt/yEscgXRrE/TiCjVRE=
X-Google-Smtp-Source: AGHT+IELufpf/afAfT2Z7Touti4YQrWwKv1deBMsWqtCBLnXQXbzuPzjEsbciqxS97VmWcBRlb27pA==
X-Received: by 2002:a05:6a20:9390:b0:159:e4ab:15ce with SMTP id x16-20020a056a20939000b00159e4ab15cemr15313432pzh.15.1699265537393;
        Mon, 06 Nov 2023 02:12:17 -0800 (PST)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id q4-20020a056a0002a400b006be4bb0d2dcsm5529216pfs.149.2023.11.06.02.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 02:12:16 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id 8B301803540B; Mon,  6 Nov 2023 17:12:10 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ross Philipson <ross.philipson@oracle.com>,
	Daniel Kiper <daniel.kiper@oracle.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH 1/2] Documentation: x86: Indent note directive for protocol version number note
Date: Mon,  6 Nov 2023 17:12:04 +0700
Message-ID: <20231106101206.76487-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231106101206.76487-1-bagasdotme@gmail.com>
References: <20231106101206.76487-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245; i=bagasdotme@gmail.com; h=from:subject; bh=0AsYoOImK8yW9QMJSvMT7LCOsE3kSASqZ9Au0ZMrQ+I=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDKkeu/tMQgvmiRbX31xtvJnR69a8J8wL+p2d772ZJldqJ xI55cPNjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAEzk1k5GhgkWZya78SyT2Tth xs4iN+3gJd7xlk45q8Mrpvud3hq9KJWRYcN78dxVl7LvnZS7EC2v6mQZwXtQz8tz0wOpTfMZLzl N5wAA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

The protocol version number note is between protocol version table and
memory layout section. As such, Sphinx renders the note directive not
only on the actual note, but until the end of doc.

Indent the directive so that only the actual protocol version number
note is rendered as such.

Fixes: 2c33c27fd603 ("x86/boot: Introduce kernel_info")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/arch/x86/boot.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/x86/boot.rst b/Documentation/arch/x86/boot.rst
index f5d2f2414de8b6..22cc7a040dae05 100644
--- a/Documentation/arch/x86/boot.rst
+++ b/Documentation/arch/x86/boot.rst
@@ -77,7 +77,7 @@ Protocol 2.14	BURNT BY INCORRECT COMMIT
 Protocol 2.15	(Kernel 5.5) Added the kernel_info and kernel_info.setup_type_max.
 =============	============================================================
 
-.. note::
+  .. note::
      The protocol version number should be changed only if the setup header
      is changed. There is no need to update the version number if boot_params
      or kernel_info are changed. Additionally, it is recommended to use
-- 
An old man doll... just what I always wanted! - Clara


