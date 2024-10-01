Return-Path: <linux-doc+bounces-26215-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B6798C95C
	for <lists+linux-doc@lfdr.de>; Wed,  2 Oct 2024 01:13:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D840C1F245C3
	for <lists+linux-doc@lfdr.de>; Tue,  1 Oct 2024 23:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6861CF2B7;
	Tue,  1 Oct 2024 23:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="GcyukvSY"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD681BDA9B
	for <linux-doc@vger.kernel.org>; Tue,  1 Oct 2024 23:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727824402; cv=none; b=bpwJjKWVlbyY3jRrJdC2Vpv0eleH+PxYE1Ssg2WmZ9WMzwCqhbQ1Ny6D6tt/uOm6Q/aWpjXhKuDVC/4Nokio8Fk1WnlKipELcJNS8QX/kzP+OlL2CUckMIuwCcgr2yMqJB56kHSoZFzh1yNtXJ/NkcRz+c3Ki3pxRQRir5hUQuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727824402; c=relaxed/simple;
	bh=w++7hzLDS/8dZ/VoZ2hephh+rP/dNT8s02ewb/5KE7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TIgVLG8fsB4KtQ20Q9laRG16PIk4N7mw5bc+77SqXuMIt4x7DYOQ2Jf/zHi4tBxBpUkIQx5yPZyF0M2bkYMYLqb12KbLLiO/+XIgQB2V4htnGjI7OUQQy0Ng+58XyAGfiNZ93+qUt6uAOMEA86d1schaJdmzrwOxHZff7qzKwq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=GcyukvSY; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20b7463dd89so33788445ad.2
        for <linux-doc@vger.kernel.org>; Tue, 01 Oct 2024 16:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727824399; x=1728429199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vF28sAx//tve6z0mOEzHepFQAlUB74FiXmJYm/deJzs=;
        b=GcyukvSYLinJqnphUXMrjaJUwm3u35ziqIER7RQ/qgNEzgXW/HhZXUR/Jj+zoQkY7d
         8GSgaHCC/Xy1hUAAgCoTG1grcZDs7mYt1DukhFCzv1O0hYcN7OYJigRphI3/ijptB6hj
         ywOmY82HQDSR43u3ptquJLfDD+arQtjeBLBWNc06ciyWe0ApQC5Hr5Wl+6jPgwUZoCML
         vll6lbiFkDfF2UF0WptnfXHPB6N1fIWsDOikSM0kOCL2AmFIQKL7w1NSB3FQw7mYbdLA
         3B5VhmYowPVERbNyKSAKHQq3Zn9S7rW+akA2cPKf5y3pOvNIjITyQmTZstykGHWKe1Ff
         Ncng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727824399; x=1728429199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vF28sAx//tve6z0mOEzHepFQAlUB74FiXmJYm/deJzs=;
        b=j7lg3CD6NpmhMAzrZ3dMoDMUByvoHtpm4o8LNRUdQcrop53pkgiqtvhhEGpHB9+X2f
         F1+w1+wXJVfPmBo8tPlRUR88hEPY1PWVSOB7KEqDN070d+qQ65QwgUePBOYzdjeaRGZ/
         O7MOWTzdmSVcl5McrWeX8ce2Uj6+V5ELLcAvvIbQcSQmuRS93g2NBWUe4TmfExrjwup8
         ckWvxF0ZMSTpZkj5TRKv6l2fJkxZ8Jw+QvbpLRSMMCzS+YzFlcWIxiaVLwKQKxR+6hDC
         MF8ktkNVDa/G3LEZnpYLqx0vcLBbtqq1VisUa92BcyWGstiRUEBv1FrNouTsszwOo/7e
         28RA==
X-Forwarded-Encrypted: i=1; AJvYcCVJN6OvU5IYqXtKgH5QL7ebSczkK1CYCbhDxR9LzdJY6gmF1TCgog3EDhYilh3gy67o6VNMdS2FSSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkDOPKYVcrmnXf+VCbvzm/UD7OnNjZ14wHaDfAoneESg9XrM/M
	pKF+IvpccK5VjYODIZR7gNNA21BX1jxXG5aCSms/Wy6sU2H//Kf7chwE00MB8oI=
X-Google-Smtp-Source: AGHT+IEIrzHYfjGFMSAlwPPGGJUrbwH3BDEgMMmzhiHFcldc7QLYwSfdGVw09IGHWqEtu37pmMpU7g==
X-Received: by 2002:a17:903:41c4:b0:20b:a431:8f17 with SMTP id d9443c01a7336-20bc5a887b7mr17332045ad.58.1727824398654;
        Tue, 01 Oct 2024 16:13:18 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e37225sm74521465ad.197.2024.10.01.16.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 16:13:18 -0700 (PDT)
Date: Tue, 1 Oct 2024 16:13:15 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Florian Weimer <fweimer@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Ross Burton <ross.burton@arm.com>,
	David Spickett <david.spickett@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v13 04/40] prctl: arch-agnostic prctl for shadow stack
Message-ID: <ZvyCC7tJT7QoKO+D@debug.ba.rivosinc.com>
References: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
 <20241001-arm64-gcs-v13-4-222b78d87eee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241001-arm64-gcs-v13-4-222b78d87eee@kernel.org>

On Tue, Oct 01, 2024 at 11:58:43PM +0100, Mark Brown wrote:
>Three architectures (x86, aarch64, riscv) have announced support for
>shadow stacks with fairly similar functionality.  While x86 is using
>arch_prctl() to control the functionality neither arm64 nor riscv uses
>that interface so this patch adds arch-agnostic prctl() support to
>get and set status of shadow stacks and lock the current configuation to
>prevent further changes, with support for turning on and off individual
>subfeatures so applications can limit their exposure to features that
>they do not need.  The features are:
>
>  - PR_SHADOW_STACK_ENABLE: Tracking and enforcement of shadow stacks,
>    including allocation of a shadow stack if one is not already
>    allocated.
>  - PR_SHADOW_STACK_WRITE: Writes to specific addresses in the shadow
>    stack.
>  - PR_SHADOW_STACK_PUSH: Push additional values onto the shadow stack.
>
>These features are expected to be inherited by new threads and cleared
>on exec(), unknown features should be rejected for enable but accepted
>for locking (in order to allow for future proofing).
>
>This is based on a patch originally written by Deepak Gupta but modified
>fairly heavily, support for indirect landing pads is removed, additional
>modes added and the locking interface reworked.  The set status prctl()
>is also reworked to just set flags, if setting/reading the shadow stack
>pointer is required this could be a separate prctl.
>
>Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
>Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>Acked-by: Yury Khrustalev <yury.khrustalev@arm.com>
>Signed-off-by: Mark Brown <broonie@kernel.org>
>---
> include/linux/mm.h         |  4 ++++
> include/uapi/linux/prctl.h | 22 ++++++++++++++++++++++
> kernel/sys.c               | 30 ++++++++++++++++++++++++++++++
> 3 files changed, 56 insertions(+)

Reviewed-by: Deepak Gupta <debug@rivosinc.com>

>

