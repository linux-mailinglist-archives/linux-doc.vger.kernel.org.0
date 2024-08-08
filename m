Return-Path: <linux-doc+bounces-22464-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9F794B30B
	for <lists+linux-doc@lfdr.de>; Thu,  8 Aug 2024 00:31:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7086E2810C6
	for <lists+linux-doc@lfdr.de>; Wed,  7 Aug 2024 22:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2440F15444E;
	Wed,  7 Aug 2024 22:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vgxVvvtU"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4364145B31
	for <linux-doc@vger.kernel.org>; Wed,  7 Aug 2024 22:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723069914; cv=none; b=n5N9iQnejCRNLlkm1qwBRcdyovE3k48fNNbYUqoHCVBmQFeH3LpaUddkRzAmVunDeSij4ontP4tj6/nuHfBrqPg+PizsTgBpabl1hCZlmB4gUDpWSexctsAcLzhgCSUe/SwccB+PFDzl/BDKmB1SvMk0fg04iaUc6jmDL0UE4lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723069914; c=relaxed/simple;
	bh=lt01zfKu7+RvwlQbSg6i9IaxHABXiXlAJBTgnDtOuJc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZoXisWR6YJtHVlbTR4Wjhjq1/hYMs+1muLvS86QkMCc0JFt7uypdmMtqGpMHkXGQ59K7D6W3LdiR21x4rv8pjzsRhILQHsnwK6afvqQLcT5H7XQJZNyMxlno2XhRp6CSsmQuN5mviQNwhWguC3SNtS2MkQgu4+SrvcjVZcjpyOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vgxVvvtU; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1ff67158052so3268645ad.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Aug 2024 15:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723069912; x=1723674712; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Eqn3LooEfKQSn1SPZrgXd7kK5ryU/WoLiCmXsEwtkWo=;
        b=vgxVvvtUH0GL2i4YA/K/6AaixhH9nFt+pWVkN+ef33SwutiHrBshkQcr7n5Zh1q6b5
         DtECo+GD9SprJCDLeJ2i/ADw0aX/mdTITg5B3bwIOSXdCyTqYo8h0qBj1fXrtNXvHnRL
         hXrVYZ8M3AXAZx6mSQuseQB8L96fKYi61WyPRShdzgUFp8LAytEbdXX2hL1FG14URqcT
         mcEapnhbw8Aq+1jydyd63OM1h9jM4FBQQxeoSWpoGbfWf4DFWyyrqUlCIOPh10o2L8fe
         77BlO48zY9KHPJ5JCZS/xxK+cCAfbTHgDFz5cUurltl6XiA3eQl0nyAWkNB0/6cg40i/
         f08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723069912; x=1723674712;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eqn3LooEfKQSn1SPZrgXd7kK5ryU/WoLiCmXsEwtkWo=;
        b=uRgXlsn5terMhoo5R1xC4BSrIpQ0XVY04pni0p3x35z6kEr7EyFVCk6LLO1U/Ky+W6
         4MrMy5JNex+MLSEwztfp37v/41BzmXEM8CnWaAV5eZgECAyw6jo6HibmPad98dWkC3tD
         MwtgY3Uld7o3eE8FO+78HhvtVPEvHhda78YUqVaxBonglF1hssUT36Mf5a9FQdTH9KXC
         e8kjUWJM37JD+BJbC052ExayyfB8P6uspgqh82mWZag0XGVBSx+iBzfk8DK4hNS9UdAx
         mGkoVMImK1fUKbuHWNst5ENBI3w7XKdCLq1pzXF1Gr3UtmibdcNLi1yQ0UVkumimztrv
         7fJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyZqmE8DPVnWapmzJk4/WISgPciFB7W5kiwpN1wpK6XbANbgaSHB4ftBREsfpWhfNr7vERZqCMzHUeLdqxL8bVYUCcJ19olkBw
X-Gm-Message-State: AOJu0YzLwSFtq39EIQIKlPm23pMUxTTfMo4gTmH+JxzbzCfIkUFg0CDc
	Gm+/9N2Ma9bVpUpzta/Z7qqufVdmRs+/gCCAW7U9yM6wlwfdYyb8YaemQjE87rA=
X-Google-Smtp-Source: AGHT+IHHjhsk2z4q9vmLjR7LsBMy2oppwwN+j14R3XW5fxPpM7oxaFufcdUW3gDCZ50Rjxk+EmoCcA==
X-Received: by 2002:a17:902:d2cc:b0:1fd:6a00:582e with SMTP id d9443c01a7336-200952641bemr1402985ad.30.1723069911749;
        Wed, 07 Aug 2024 15:31:51 -0700 (PDT)
Received: from localhost ([2804:14c:87d5:5261:6c30:472f:18a6:cae1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff5917767fsm111712115ad.183.2024.08.07.15.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 15:31:51 -0700 (PDT)
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
Subject: Re: [PATCH v10 34/40] kselftest/arm64: Add very basic GCS test program
In-Reply-To: <20240801-arm64-gcs-v10-34-699e2bd2190b@kernel.org> (Mark Brown's
	message of "Thu, 01 Aug 2024 13:07:01 +0100")
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
	<20240801-arm64-gcs-v10-34-699e2bd2190b@kernel.org>
Date: Wed, 07 Aug 2024 19:31:49 -0300
Message-ID: <87o764dkx6.fsf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mark Brown <broonie@kernel.org> writes:

> This test program just covers the basic GCS ABI, covering aspects of the
> ABI as standalone features without attempting to integrate things.
>
> Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/arm64/Makefile        |   2 +-
>  tools/testing/selftests/arm64/gcs/.gitignore  |   1 +
>  tools/testing/selftests/arm64/gcs/Makefile    |  18 ++
>  tools/testing/selftests/arm64/gcs/basic-gcs.c | 357 ++++++++++++++++++++++++++
>  tools/testing/selftests/arm64/gcs/gcs-util.h  |  90 +++++++
>  5 files changed, 467 insertions(+), 1 deletion(-)

The basic-gcs test passes on my FVP setup:

Tested-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>

-- 
Thiago

