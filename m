Return-Path: <linux-doc+bounces-21756-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF704942A49
	for <lists+linux-doc@lfdr.de>; Wed, 31 Jul 2024 11:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A0722861DC
	for <lists+linux-doc@lfdr.de>; Wed, 31 Jul 2024 09:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3244F1AB520;
	Wed, 31 Jul 2024 09:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ilXaq/dB"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFC01AB50B
	for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 09:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722417677; cv=none; b=fj9PpwmFA6j7JDAdR3dKf1Ljw5EVHQ+/cuKs/4/VphFCMgsvF6p2CHcgVVFbQKyLK9pZ4Szr05blwiQJ/RFJx9r20wPFKW1FkwNww1uCC592e7OLm5DxUm+AH8Hp00kl8M7T45bGD5t2+ny4NTDypBfWOrSZ9QLiUUp3w8i1MXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722417677; c=relaxed/simple;
	bh=cnT5wqUVzDuz/5cZp8Yjlz64Hy6NEUy0SoJibqkgiPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwaA1fNFSIrw9N8JwOzrXLr/WBXkkXgNNWJtTL0mhxOKG4gxjAvfqpKO663yqQgCaF7+mYeRJLUSUvJYnaTrQafFB7b3dRJZWqpBhj0QZlVVb7eyUPDBBZ26ILeSbfgAmY2LISwEHV64FRGrajSx6itiMfYS8OnQ0mW5A4+eGMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ilXaq/dB; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3687f91af40so2998027f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 02:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722417674; x=1723022474; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u/qpTJRAl+gvdV7bUrhFzBBY9zM/wQim6oqoBtynaYM=;
        b=ilXaq/dBTfrnJjqnloNU/2tMCO9QYU4DvFHHYtGtJRZ77yx6Bo/qiOAZ5Zlrbgwyod
         lKX/61ULB8iijUF39t7KdMMGoYjYTke11WBmkJp5Mwv7759krRPmacsR/zb6PJxwTOGk
         GrlLvkSy9ApsJuhHbqPEfcfbbGb0hK4ViDy6PoIIAwKb4Ug79wpD3sshX9XjcCBLBObn
         Yn9XY4In14Xdt15BM9gYsZ8/0kzjx7bgsUnjQuOBcKI7bGAjul7zlLs9W9Cj+gsmJUHe
         supKBtxpo8Oi7q09Ydj7Bsq/DExNqxr/DKFa8VOvKBy9fZw2dS7fip7fjAvwvOiF006D
         GROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722417674; x=1723022474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/qpTJRAl+gvdV7bUrhFzBBY9zM/wQim6oqoBtynaYM=;
        b=qw+IoV+wyusGCFzjYlUW0sQlH83OT+wOcFAANBZVQOfubzBtrNgjP0d0FqTyExXND7
         mqpHdltWvBGXtOSvY3V3AMnMRGdCF9RSquh0xtYZLEg0nYaU1kVAJBmceAS1DfenAw2T
         gTb6lowbaeNusiv+v+T0M4tJSkelPZkf3iC5uNu4bDuXXoJdBxRylW5h7OqNlb9Xi3Sx
         J8UrBASjtYIy7ffYmVQjr99r8iFq2rvVYALrjAlC3iiCoG20RFhV1nd9+vRI/jZiMlU7
         qpWtRvrn75WO/Se5LpR2SShdeycDDNaeDlLfje+qpe4GYW2L/wR6BRFmbiv3tUqTFeTC
         HAgw==
X-Forwarded-Encrypted: i=1; AJvYcCX1bXLjTs2zZB6T55qLdR1HuTs3l+9G4zZIuq3yrckoTi6OeP8Fazs4zrasunHJDZrI+nDM2D01vS40KTAzslesCIag5T95V1uF
X-Gm-Message-State: AOJu0Yx0TrSoCaR7ildAuxkSp+gREeUGhWjel1FjLE1PTidtBcHfX6Th
	rD4MN3K6bMR5lz4sx3GIsGk6G7YAORZpqJyiZrZMiLqFpcUmgVwz0Qa9gKHU5HA=
X-Google-Smtp-Source: AGHT+IFNedUVNOOS5mp++68QmWlLVDtW+9dpvo4dm4U/i/Dgou2+lFIJYCAAaKRlPzCMYiIRYjEZww==
X-Received: by 2002:a5d:6787:0:b0:362:d382:2569 with SMTP id ffacd0b85a97d-36b5d08f68bmr8441211f8f.44.1722417673355;
        Wed, 31 Jul 2024 02:21:13 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36416e2esm16592253f8f.0.2024.07.31.02.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 02:21:12 -0700 (PDT)
Date: Wed, 31 Jul 2024 11:21:12 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v4 03/13] riscv: Implement cmpxchg32/64() using Zacas
Message-ID: <20240731-a49ee87a149ba9bf333378d0@orel>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
 <20240731072405.197046-4-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731072405.197046-4-alexghiti@rivosinc.com>

On Wed, Jul 31, 2024 at 09:23:55AM GMT, Alexandre Ghiti wrote:
> This adds runtime support for Zacas in cmpxchg operations.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/Kconfig               | 16 +++++++++++
>  arch/riscv/Makefile              |  3 ++
>  arch/riscv/include/asm/cmpxchg.h | 48 +++++++++++++++++++++-----------
>  3 files changed, 50 insertions(+), 17 deletions(-)

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

