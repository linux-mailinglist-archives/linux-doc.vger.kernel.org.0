Return-Path: <linux-doc+bounces-21020-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0749370EC
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jul 2024 01:03:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 193132825CD
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jul 2024 23:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A7D7B3FA;
	Thu, 18 Jul 2024 23:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W+PBN2aR"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DD378C76
	for <linux-doc@vger.kernel.org>; Thu, 18 Jul 2024 23:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721343828; cv=none; b=SHNWCTpvu8218Rf89N183lo30ihOadX2nYUGFUCsw7xIQ4qeRmfET8I0sf3bNtjb8V5X5/FSCwsd1rkuQJ4Dpng/rfCnufCVvXqM9yraLmvbyzo/uMwqJhJ7LSygG/tynvv4GSUwEcwQ+04YyLqf4bvylMZxdBbvdKJGpFG3FtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721343828; c=relaxed/simple;
	bh=ZlxohWJiVwAqoT9g5IouKqA+eC9Q/GshbQdY1r9is2Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ofxU+28ud704jjFehsuC2aQw9m/BJfCvaAiOlV1yOVHi23lnJaHLBYL2eeF5LtbSSanb8fDbIR/aMc7rOwvXbgnQL2XBpJ0peSBvtgj3UmAmTp/TV56g2sIjM/UzymxRBheePSdzy2mI/Y6B0V6r6qYxnizqAku4j7KGUTKXYnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W+PBN2aR; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fb1c69e936so9664895ad.3
        for <linux-doc@vger.kernel.org>; Thu, 18 Jul 2024 16:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721343825; x=1721948625; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pz/gqH3g6k+Tlg5PlSG754DQsZEyo/RAObvbOwwmn1M=;
        b=W+PBN2aRA4gn0ZHLHAD3l3+rtcOMqbNhBblqTH10seGmxKXSIM/gdGXfqr2NJVCcC/
         /TRUnWk77f+K+ZVvbKkg5rquOwN0y4TxqeXNA9O8k3pMEkNdRvodmtYyGgs5bqbfHHKT
         2t3c5ue9lwf4FtZA9w8GcIYkJ6AmWgHfOERhM2n4M9l5xieCZQyGj3ewMRYI9DFIGgHJ
         6ntB6euLzI6KsDTQpIE2oCqhqxJ9U3gPRfQLOIU3b3ssX+Wk2/+/BBL6/+mi99YQDj4R
         CAF9uFTz47IQVvxL0BvqD98C9SgIk8j21PmbrDDJccOIFbGzRc+PXxLHLsIVj+HWENAZ
         8JnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721343825; x=1721948625;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pz/gqH3g6k+Tlg5PlSG754DQsZEyo/RAObvbOwwmn1M=;
        b=FKihs3mSVpvcCYYlQCWxg2izyxh06BDkDL0GtFBj4k1eArdlL3YZWJ+Wp+fnamuEn7
         STFkXPSD6mskqWCN2w66WYLX37NdJynbSWH+am4Dj/p8Xhoaj2Cl09UWTMFVqC/ept9G
         7KsZ5GVQmz0u/2jJMerWXxkDQ0hjd7515PSbV91zTbv03VfGmllsSPe3NsQr/XBKA4WQ
         z9tJPSwOQXZX+k4Xjyk7nk/0lBr8/5FGTIrd+38EkduzMIidUvcAYa+AL+lWXc4G7ePP
         URE/GkobTU2ZEqBOePfZJDmyhZPuFnbyJOFVCIJ59IpufOFz1ydDRWyqfBPHHTZ3vMp1
         +77g==
X-Forwarded-Encrypted: i=1; AJvYcCWqx+T+LjSZo9oV6CrWln13nIeFipo7SVkikmud/0vtJf3qR0FT/eg0ZEbpStU5zYR14xm6yUHWEbwJrzs7x1y1G5FWpfLhrFEj
X-Gm-Message-State: AOJu0YwQNPzBcusfwBu+0HATpoqMOgGn5sWZhANjQO75+EFFFkXAGuKJ
	t6E9MMzUE4p0wENVG+jvKAWebWLG2NcrwrjEUHV0zqPaWCfjEgka/xrruxy+Kvc=
X-Google-Smtp-Source: AGHT+IF1+3P0pRgwkXsR0FAWIIytKywrIML3Fqxwpp1fn6IdRgXx4TsuO6HiuiBf9bLph6vSY6g+qA==
X-Received: by 2002:a17:902:d48d:b0:1fb:24ea:fe02 with SMTP id d9443c01a7336-1fc4e16ab7emr52140735ad.18.1721343825147;
        Thu, 18 Jul 2024 16:03:45 -0700 (PDT)
Received: from localhost ([2804:14d:7e39:8470:15c8:3512:f33c:2f80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd64b8693asm1105435ad.72.2024.07.18.16.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 16:03:44 -0700 (PDT)
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon
 <will@kernel.org>,  Jonathan Corbet <corbet@lwn.net>,  Andrew Morton
 <akpm@linux-foundation.org>,  Marc Zyngier <maz@kernel.org>,  Oliver Upton
 <oliver.upton@linux.dev>,  James Morse <james.morse@arm.com>,  Suzuki K
 Poulose <suzuki.poulose@arm.com>,  Arnd Bergmann <arnd@arndb.de>,  Oleg
 Nesterov <oleg@redhat.com>,  Eric Biederman <ebiederm@xmission.com>,
  Shuah Khan <shuah@kernel.org>,  "Rick P. Edgecombe"
 <rick.p.edgecombe@intel.com>,  Deepak Gupta <debug@rivosinc.com>,  Ard
 Biesheuvel <ardb@kernel.org>,  Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
  Kees Cook <kees@kernel.org>,  "H.J. Lu" <hjl.tools@gmail.com>,  Paul
 Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>,  Florian Weimer <fweimer@redhat.com>,
  Christian Brauner <brauner@kernel.org>,  Ross Burton
 <ross.burton@arm.com>,  linux-arm-kernel@lists.infradead.org,
  linux-doc@vger.kernel.org,  kvmarm@lists.linux.dev,
  linux-fsdevel@vger.kernel.org,  linux-arch@vger.kernel.org,
  linux-mm@kvack.org,  linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org
Subject: Re: [PATCH v9 37/39] kselftest/arm64: Add GCS signal tests
In-Reply-To: <20240625-arm64-gcs-v9-37-0f634469b8f0@kernel.org> (Mark Brown's
	message of "Tue, 25 Jun 2024 15:58:05 +0100")
References: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
	<20240625-arm64-gcs-v9-37-0f634469b8f0@kernel.org>
Date: Thu, 18 Jul 2024 20:03:41 -0300
Message-ID: <87a5iexpyq.fsf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mark Brown <broonie@kernel.org> writes:

> Do some testing of the signal handling for GCS, checking that a GCS
> frame has the expected information in it and that the expected signals
> are delivered with invalid operations.
>
> Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/arm64/signal/.gitignore    |  1 +
>  .../selftests/arm64/signal/test_signals_utils.h    | 10 +++
>  .../arm64/signal/testcases/gcs_exception_fault.c   | 62 +++++++++++++++
>  .../selftests/arm64/signal/testcases/gcs_frame.c   | 88 ++++++++++++++++++++++
>  .../arm64/signal/testcases/gcs_write_fault.c       | 67 ++++++++++++++++
>  5 files changed, 228 insertions(+)

The gcs_write_fault test fails for me, even without THP:

$ sudo ./run_kselftest.sh -t arm64:gcs_write_fault
TAP version 13
1..1
# timeout set to 45
# selftests: arm64: gcs_write_fault
# # GCS write fault :: Normal writes to a GCS segfault
# Registered handlers for all signals.
# Detected MINSTKSIGSZ:4720
# Required Features: [ GCS ] supported
# Incompatible Features: [] absent
# Testcase initialized.
# Read value 0x0
# SIG_OK -- SP:0xFFFFCF1292D0  si_addr@:0xffffba645000  si_code:10  token@:(nil)  offset:-281473808879616
# si_code != SEGV_ACCERR...test is probably broken!
# -- RX UNEXPECTED SIGNAL: 6 code -6 address 0xf76
# ==>> completed. FAIL(0)
not ok 1 selftests: arm64: gcs_write_fault # exit=1

It also generates an "INVALID GCS" line in dmesg.

-- 
Thiago

