Return-Path: <linux-doc+bounces-21022-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DAD937118
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jul 2024 01:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DEA8281D64
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jul 2024 23:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC052146A9A;
	Thu, 18 Jul 2024 23:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OBRwph2b"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34501DA3D
	for <linux-doc@vger.kernel.org>; Thu, 18 Jul 2024 23:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721345664; cv=none; b=YcL6CDWtkzRukoKANrw4z5SZ8zWX6ahX+yoS67R7d7DJF+C8YLuTivn4H/LBBz5ToGSXhgwQS53SS5JnoEpaEuXiOZP0RFgIdVrGF4yTdCzyBHGcohEm8y9R2MtA0QWL+ex4jbwGdYpSuunBkEJ8iqwNe92G3xhmSZmCOitzH9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721345664; c=relaxed/simple;
	bh=Uy508/sq/1r69twOonqkXxOzsVEWpYS/wUjciXNylJA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Yqx/NbwOI7RRXEvZ8XZpb1W+6qXJwTgPrcrDS1W+Qli6GElJyES25wrd1qsqfZ3rxaBYV6k4eejl2ZD398RywhjGs9hxaHQXAonohOais5LVb3CCDQPbd+hFSSSdU73JMSmrIq7i/hQhqS4uwhROfeHixqXddOyhGLyXsWtGm6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OBRwph2b; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-75ee39f1ffbso942879a12.2
        for <linux-doc@vger.kernel.org>; Thu, 18 Jul 2024 16:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721345661; x=1721950461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qF+1IDJjtH4yt3+dIXZUb/sL6BCvMKOBa4IWo3wL00=;
        b=OBRwph2bOZFJZqvRS5njRtYRwsLZGyu4h1LTZ9Bjx2jEh8jXmBrZ/1sPvlu4j/lUEo
         RhSupdWRc9u+kJ4I6AAwhuBpYTgJmmN/6WxbCrsfN3ccabPXFZvTHwE9egtdXJ6BrkAq
         MBxVhYA6c3tFRK2HR7vyMoKNffI9wllaFIk/bQqGLzQwtJxENgpxmSDKxT5DR74Tn5s+
         vDsxZe8rr8Buv2q1luFXjP84Yh97oU6Jpr7jSBJNp3eVNfbfc227Fda+pLApIyknfwxE
         HX4BOw+CdETcS56vq5C04U1TEaj7UpD/umq0et8yDVT0RtI2KRqzedgPr44ZXBUdS3ZA
         nuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721345661; x=1721950461;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qF+1IDJjtH4yt3+dIXZUb/sL6BCvMKOBa4IWo3wL00=;
        b=xASX8hAq3dnENntFUgw1z43coNipdl1KqLd9jZatws6z4IL0iA/PEWocARHXPgjAjJ
         TuI8v9ca1AXwA6/rsPxAUg/QRHsAnnCT22OLLglFhVKlJ9wbNJMbkPXjxRT+TKc2NDZy
         LlncnjEKs2krr6IZNAXbuHGpbNfOL8lFau04rAAD8jdFXHOWh4lQzgRXpme5YnGhXrc5
         LZqLT0pn86bisZqs1E5MrN6/05b2JVFITHROBtnHT9m11npJ/VoUzGTzWyJYtTLDI2sk
         xjyHLtzTBRoHTzbS81V5S0KfIXKDuxvov4WS4LWHqabWqVEMnRM9WXkLYKhyV6ARJNNF
         HtsA==
X-Forwarded-Encrypted: i=1; AJvYcCVtj+MvX6H1A6WolWtjcip6zPJvBN+tZoRvNT4vco91/1tqs4SGnsfR1O6G+A7Niiu5575t+CkJl69xc+f04OTf7DJCwbbV8kZd
X-Gm-Message-State: AOJu0YziBd8OqzbvcCyYD+fp7inW2DCyUtf6sYYJLdlCKre083kgdiUi
	DfE09qXrnS0UhrltDNjHQ/5EnfgfyDCvlztVqezxTyk4GT+R1OiB9OVf+lv1qFE=
X-Google-Smtp-Source: AGHT+IEKbX/FsbhFnIw71MBLVcrzrP5T77uZDA6cQicktN0+nhvg+Wct/m4wkCJiaiaT9dRkb2DrPg==
X-Received: by 2002:a05:6a20:918c:b0:1c3:a411:dc45 with SMTP id adf61e73a8af0-1c3fdd6b4e7mr7804327637.39.1721345661197;
        Thu, 18 Jul 2024 16:34:21 -0700 (PDT)
Received: from localhost ([2804:14d:7e39:8470:15c8:3512:f33c:2f80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ccf7c72075sm199845a91.28.2024.07.18.16.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 16:34:20 -0700 (PDT)
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
Subject: Re: [PATCH v9 38/39] kselftest/arm64: Add a GCS stress test
In-Reply-To: <20240625-arm64-gcs-v9-38-0f634469b8f0@kernel.org> (Mark Brown's
	message of "Tue, 25 Jun 2024 15:58:06 +0100")
References: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
	<20240625-arm64-gcs-v9-38-0f634469b8f0@kernel.org>
Date: Thu, 18 Jul 2024 20:34:18 -0300
Message-ID: <875xt2xojp.fsf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Mark Brown <broonie@kernel.org> writes:

> Add a stress test which runs one more process than we have CPUs spinning
> through a very recursive function with frequent syscalls immediately prior
> to return and signals being injected every 100ms. The goal is to flag up
> any scheduling related issues, for example failure to ensure that barriers
> are inserted when moving a GCS using task to another CPU. The test runs f=
or
> a configurable amount of time, defaulting to 10 seconds.
>
> Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/arm64/gcs/.gitignore       |   2 +
>  tools/testing/selftests/arm64/gcs/Makefile         |   6 +-
>  tools/testing/selftests/arm64/gcs/asm-offsets.h    |   0
>  .../selftests/arm64/gcs/gcs-stress-thread.S        | 311 ++++++++++++
>  tools/testing/selftests/arm64/gcs/gcs-stress.c     | 532 +++++++++++++++=
++++++
>  5 files changed, 850 insertions(+), 1 deletion(-)

This test fails for me, even without THP:

$ sudo ./run_kselftest.sh -t arm64:gcs-stress
TAP version 13
1..1
# timeout set to 45
# selftests: arm64: gcs-stress
# TAP version 13
# 1..9
# # 8 CPUs, 9 GCS threads
# # Will run for 10s
# # Started Thread-4030
# # Started Thread-4031
# # Started Thread-4032
# # Started Thread-4033
# # Started Thread-4034
# # Started Thread-4035
# # Started Thread-4036
# # Started Thread-4037
# # Started Thread-4038
# # Waiting for 9 children
# # Waiting for 9 children
# # Thread-4030: Failed to enable GCS
# # Thread-4031: Failed to enable GCS
# # Thread-4032: Failed to enable GCS
# # Thread-4033: Failed to enable GCS
# # Thread-4034: Failed to enable GCS
# # Thread-4035: Failed to enable GCS
# # Thread-4036: Failed to enable GCS
# # Thread-4038: Failed to enable GCS
# # Thread-4037: Failed to enable GCS
# # Sending signals, timeout remaining: 10000ms
# # Sending signals, timeout remaining: 9900ms
    =E2=8B=AE
# # Sending signals, timeout remaining: 200ms
# # Sending signals, timeout remaining: 100ms
# # Finishing up...
# # Thread-4030 exited with error code 255
# not ok 1 Thread-4030
# # Thread-4031 exited with error code 255
# not ok 2 Thread-4031
# # Thread-4032 exited with error code 255
# not ok 3 Thread-4032
# # Thread-4033 exited with error code 255
# not ok 4 Thread-4033
# # Thread-4034 exited with error code 255
# not ok 5 Thread-4034
# # Thread-4035 exited with error code 255
# not ok 6 Thread-4035
# # Thread-4036 exited with error code 255
# not ok 7 Thread-4036
# # Thread-4037 exited with error code 255
# not ok 8 Thread-4037
# # Thread-4038 exited with error code 255
# not ok 9 Thread-4038
# # Totals: pass:0 fail:9 xfail:0 xpass:0 skip:0 error:0
ok 1 selftests: arm64: gcs-stress

--=20
Thiago

