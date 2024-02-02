Return-Path: <linux-doc+bounces-8213-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E90847620
	for <lists+linux-doc@lfdr.de>; Fri,  2 Feb 2024 18:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AC9B1F2D6FA
	for <lists+linux-doc@lfdr.de>; Fri,  2 Feb 2024 17:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8B4714C5A5;
	Fri,  2 Feb 2024 17:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SHWnzrlu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C719114C597
	for <linux-doc@vger.kernel.org>; Fri,  2 Feb 2024 17:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706895042; cv=none; b=YPbD3IW4TLkrwLRkLMhdi+bLhhAl+bFy2ljWmTTg3nJkv9HPjQ3jmYjx9+0Ohv0wFclUlC6ZmNpuE2Xlt/vyB8f03YFvB5VcW1N5ZHXh0dDNtm5fqiSek/oQdKfj/gKrJNtWMaee4FoZ/6sylhvMlG6itGikKMvFvNA7Ghac9I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706895042; c=relaxed/simple;
	bh=2doe7Rnh2cfYTExP59GbRKeFESMtXfgH6+kHay/XYgs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SoXCjNTd/keeXbE8DjrzNgi7XauUCQxT+W2IjjPjDMEwBvWX4a/Xhdz2rWQHQj91IhmgSgBMutcjA9UlI759uyk2w33NNLciCoHbqi95jfjmLXLVac8Q8PRyYj0N7UaXIsUzXnQSD5Xxh+MgXB3MeZ0WhthSBuYZDJXRTpMZTgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SHWnzrlu; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-55f0367b15fso3100191a12.0
        for <linux-doc@vger.kernel.org>; Fri, 02 Feb 2024 09:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706895039; x=1707499839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VC5vJdORBChkJeHwFEmBTnLuqGC0FMrsRwyZcN+KE/8=;
        b=SHWnzrluA44ZDiQCs6yI/CNYRyFWJ5cvRemavkE4kIZ1+kC62SBVDCEP3dx77s1X0R
         6gqMkKBVuIy0x2QI+IyX3uXf5I0ohB367/y2hO5Y5hnouYwOoBeODS+gwPyYfPgGkhC0
         IxPYXlox7nL87jEQbqF4uwYe8DTv3YfUaHldc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706895039; x=1707499839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VC5vJdORBChkJeHwFEmBTnLuqGC0FMrsRwyZcN+KE/8=;
        b=DtyzOaSPH/FFGJ8pLSBQo5ee4xh2fNrlsgG0GpdG7EOwFgXVG3nKmhP/Cb7oEkYKJQ
         1hEpCkQkHef72215N7eiIi4zxyzHD42nE6nOv39bK61F5gkdl2q31YPPXsy4DWNPbCcX
         0xpaI0ijqJ9uWhwCyZLNJ/nGbewHhYmqaGDhNxawOOzOd5E/9phF090yaxTFiEnKrBBZ
         kCWTEcvLzDjy8caYk+4JhRHbi9AC2DBvLprkXbDAQdBsQfkHAGIpQ8Y391/0leyTrvY7
         wcekwTMBTFzmsK9HHCbS/e9cPYzM5FBxthubUXuv1HLwTYLB5XyZn4XUg5tUnuXkOatl
         Pklw==
X-Gm-Message-State: AOJu0YyVXEk4d1Dtvvr+KwmMctabmIZHEDHILxHQxzrEYS+7Gr2Q5gzC
	fvKt7RvSf2TFhziXgxLxACQ9XtLxqlmMppanfAaGDOZ3y7L4BsaMn8L5xrCTmA==
X-Google-Smtp-Source: AGHT+IG1HErWZnyyHQSeGiKtyMdVerFNECncUUd+5zGq4gXzObiZ/ksbYjQQAYMUm32Ai9vzo+62Ow==
X-Received: by 2002:a17:906:3ad1:b0:a36:84f5:5186 with SMTP id z17-20020a1709063ad100b00a3684f55186mr1897465ejd.77.1706895038981;
        Fri, 02 Feb 2024 09:30:38 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVoNRQtsktnhKqsQgth/Jzy6fvhViLBtHaC32Wc+CfldyFICiQswcGmg+tYTe6fcJJE6SXBOebY7AGhCY5TzPSpu4khIX5k0IXeiDWk81gBRjuVesFgMX/8Wu1MYjfMMllrYbHe0K3zUhWjUjZpQg1l753MWXySN6XFuLTBo2aAZ1MPnhZZEkmye7WfxY/NRJH52N1zQg5E9swSHq+1EvebLk5jvHJv4Jxvkh7CVb2MLxK9c3pC/yUovmZWkOWwnAfaf/8Md0JFVNR/e5BkCobQNpZ2eIBfyeTBFgordCWD11YYQ4ugXx59ZzhTsGKtYSSxfTVibDKASHZ76EiRDyWR2YjGKfAiPtGb69vlRTSxvOSLhqokzBsOCLx2hZLMx7s0C4OCD0FQbYkzHLEBhexR1nrEC73ENVUC
Received: from chromium.org (66.224-78-194.adsl-static.isp.belgacom.be. [194.78.224.66])
        by smtp.gmail.com with ESMTPSA id hd34-20020a17090796a200b00a36f314daa6sm1083392ejc.46.2024.02.02.09.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 09:30:38 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Simon Glass <sjg@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	Will Deacon <will@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [PATCH v10 0/2] arm64: Add a build target for Flat Image Tree
Date: Fri,  2 Feb 2024 10:30:32 -0700
Message-Id: <20240202173034.221790-1-sjg@chromium.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Flat Image Tree (FIT) is a widely used file format for packaging a
kernel and associated devicetree files[1]. It is not specific to any
one bootloader, as it is supported by U-Boot, coreboot, Linuxboot,
Tianocore and Barebox.

This series adds support for building a FIT as part of the kernel
build. This makes it easy to try out the kernel - just load the FIT
onto your tftp server and it will run automatically on any supported
arm64 board.

The script is written in Python, since it is easy to build a FIT using
the Python libfdt bindings. For now, no attempt is made to compress
files in parallel, so building the 900-odd files takes a while, about
6 seconds with my testing.

The series also includes a minor clean-up patch.

[1] https://github.com/open-source-firmware/flat-image-tree

Changes in v10:
- Make use of dtbs-list file
- Mention dtbs-list and FIT_COMPRESSION
- Update copyright year
- Update cover letter to take account of an applied patch

Changes in v9:
- Move the compression control into Makefile.lib

Changes in v8:
- Drop compatible string in FDT node
- Correct sorting of MAINTAINERS to before ARM64 PORT
- Turn compress part of the make_fit.py comment in to a sentence
- Add two blank lines before parse_args() and setup_fit()
- Use 'image.fit: dtbs' instead of BUILD_DTBS var
- Use '$(<D)/dts' instead of '$(dir $<)dts'
- Add 'mkimage' details Documentation/process/changes.rst
- Allow changing the compression used
- Tweak cover letter since there is only one clean-up patch

Changes in v7:
- Drop the kbuild tag
- Add Image as a dependency of image.fit
- Drop kbuild tag
- Add dependency on dtbs
- Drop unnecessary path separator for dtbs
- Rebase to -next

Changes in v6:
- Drop the unwanted .gz suffix

Changes in v5:
- Drop patch previously applied
- Correct compression rule which was broken in v4

Changes in v4:
- Use single quotes for UIMAGE_NAME

Changes in v3:
- Drop temporary file image.itk
- Drop patch 'Use double quotes for image name'
- Drop double quotes in use of UIMAGE_NAME
- Drop unnecessary CONFIG_EFI_ZBOOT condition for help
- Avoid hard-coding "arm64" for the DT architecture

Changes in v2:
- Drop patch previously applied
- Add .gitignore file
- Move fit rule to Makefile.lib using an intermediate file
- Drop dependency on CONFIG_EFI_ZBOOT
- Pick up .dtb files separately from the kernel
- Correct pylint too-many-args warning for write_kernel()
- Include the kernel image in the file count
- Add a pointer to the FIT spec and mention of its wide industry usage
- Mention the kernel version in the FIT description

Simon Glass (2):
  arm64: Add BOOT_TARGETS variable
  arm64: boot: Support Flat Image Tree

 Documentation/process/changes.rst |   9 +
 MAINTAINERS                       |   7 +
 arch/arm64/Makefile               |  11 +-
 arch/arm64/boot/.gitignore        |   1 +
 arch/arm64/boot/Makefile          |   6 +-
 scripts/Makefile.lib              |  16 ++
 scripts/make_fit.py               | 298 ++++++++++++++++++++++++++++++
 7 files changed, 345 insertions(+), 3 deletions(-)
 create mode 100755 scripts/make_fit.py

-- 
2.34.1


