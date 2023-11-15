Return-Path: <linux-doc+bounces-1728-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1A77E1E00
	for <lists+linux-doc@lfdr.de>; Mon,  6 Nov 2023 11:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AEF91C20AF2
	for <lists+linux-doc@lfdr.de>; Mon,  6 Nov 2023 10:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C04F21774B;
	Mon,  6 Nov 2023 10:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLeFYjmx"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C843017730
	for <linux-doc@vger.kernel.org>; Mon,  6 Nov 2023 10:12:18 +0000 (UTC)
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D95DB8;
	Mon,  6 Nov 2023 02:12:17 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6d2fedd836fso2857467a34.1;
        Mon, 06 Nov 2023 02:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699265536; x=1699870336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4r3fxaflm8Rb1r3UO8ZFUzVieAzzOq9dAGwIkPoNP4=;
        b=bLeFYjmxPXnL3CGCyLjaehGS89KXs2/loHij9r4ozwgnuaFwkiwbijCo3UfvoXnlDE
         iVdqooJ6DDS1qWEPV1k4KCvkwidbu79riNCNokyXTOE1FznPZ1G9vrEI49Xm61SuDkel
         /baXxJuH2lLLgB/qzpYPzYV3sQWWPQ/q2qOmCqt4IwXf0XbwXx6fmWY97y/VG7H2J2zC
         gGgXHcpJGmmwfoQljFp5nPcFtOpbu4DWeBAuJ8sVFZpaD03rbdgmOo1bvKJa9mUigykM
         zaS6LEtNvADTrKg/dp3yVgJwIPqXgpchu/Ex0cd+A2koKf40VZEXi8w4+J7db4O1Zu77
         sHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699265536; x=1699870336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4r3fxaflm8Rb1r3UO8ZFUzVieAzzOq9dAGwIkPoNP4=;
        b=pXb+6kB2St/8UPTS5x4bNUTaJ5EesJcGtS9v9KkVqbtP536inwATGLCh1YUIQtDl1n
         9G2uvDHee8eOmXzrBJJbRXuDINyBKealOPN3a2cgqpdZaMNIU7n715sqp+SAe4ycFcEr
         eNDAzxxEo6dttU+Rlyaqtqdhr9HGlsZRa45eq57k+e6J2hu7In4TIjlpyW72/t/hqsIN
         ikAEDkxCrregWITqrEWQUAsc8l5bQj1YcJNCwsqtqDbSZdwIMdvmFSFx/n6VoS4kpQCf
         +0eQLAYC+mqZQL1A54pw/Hvj55gJaIICiv3hQOsjyUg+mZNZM+9z7YEAIUTKtj1hTfHK
         N6/w==
X-Gm-Message-State: AOJu0Yxt0kaJleEvqVkQn/ZzADCjevD4lEdgy7W2Z71ixrm5r9G8xJT0
	DHvWefSEjAB+042wBnc7w04=
X-Google-Smtp-Source: AGHT+IEG9SVOths7LJ3i0W/+eQV7ES3q00OVVfM8YXr6I9gSd7tf7n2fEHkU1qlVz6xt1wHLyOzQRw==
X-Received: by 2002:a05:6830:4d8:b0:6b9:6a43:1f7c with SMTP id s24-20020a05683004d800b006b96a431f7cmr28606199otd.26.1699265536451;
        Mon, 06 Nov 2023 02:12:16 -0800 (PST)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id b3-20020a63cf43000000b0056c2f1a2f6bsm5185612pgj.41.2023.11.06.02.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 02:12:15 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id 9E32080FD147; Mon,  6 Nov 2023 17:12:10 +0700 (WIB)
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
Subject: [PATCH 2/2] Documentation: x86: Wrap EFI handover deprecation in note block
Date: Mon,  6 Nov 2023 17:12:05 +0700
Message-ID: <20231106101206.76487-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231106101206.76487-1-bagasdotme@gmail.com>
References: <20231106101206.76487-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659; i=bagasdotme@gmail.com; h=from:subject; bh=xpTSVbWHAAVOKSR7S+D95bM59pcWw6ryHRaMDExVMuE=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDKkeu/vs15nunprjf7pgXoLQhjNenApeDwTFtoo87WG6G OosXT+xo5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABMxk2L4p8jsO/P7i/XZ1fMd JdqnJEYEh82+m2n3JUymdHdn1OO9kxkZOq5tdul/sGlLB5PQjqwb2gF+u4t4LPw/WbkH5QfnLmv kBwA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

EFI handover protocol depreciation note is the only admonition in the
doc that is written as normal paragraph instead. Use note:: block for
that purpose.

Fixes: 8b84769a7a15 ("Documentation/x86, efi/x86: Clarify EFI handover protocol and its requirements")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/arch/x86/boot.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/x86/boot.rst b/Documentation/arch/x86/boot.rst
index 22cc7a040dae05..67cbb75cea6fdf 100644
--- a/Documentation/arch/x86/boot.rst
+++ b/Documentation/arch/x86/boot.rst
@@ -1432,7 +1432,8 @@ The boot loader *must* fill out the following fields in bp::
 
 All other fields should be zero.
 
-NOTE: The EFI Handover Protocol is deprecated in favour of the ordinary PE/COFF
+.. note::
+      The EFI Handover Protocol is deprecated in favour of the ordinary PE/COFF
       entry point, combined with the LINUX_EFI_INITRD_MEDIA_GUID based initrd
       loading protocol (refer to [0] for an example of the bootloader side of
       this), which removes the need for any knowledge on the part of the EFI
@@ -1440,4 +1441,4 @@ NOTE: The EFI Handover Protocol is deprecated in favour of the ordinary PE/COFF
       requirements/limitations regarding the placement of the command line
       and ramdisk in memory, or the placement of the kernel image itself.
 
-[0] https://github.com/u-boot/u-boot/commit/ec80b4735a593961fe701cc3a5d717d4739b0fd0
+      [0] https://github.com/u-boot/u-boot/commit/ec80b4735a593961fe701cc3a5d717d4739b0fd0
-- 
An old man doll... just what I always wanted! - Clara


