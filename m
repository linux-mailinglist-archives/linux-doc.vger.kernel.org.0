Return-Path: <linux-doc+bounces-17311-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB108D4F05
	for <lists+linux-doc@lfdr.de>; Thu, 30 May 2024 17:25:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49DA2B27F9D
	for <lists+linux-doc@lfdr.de>; Thu, 30 May 2024 15:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103D317624F;
	Thu, 30 May 2024 15:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="z5CDVYIG"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03B12576E
	for <linux-doc@vger.kernel.org>; Thu, 30 May 2024 15:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717082749; cv=none; b=CUIIyh6MNSLs2IRymiDUGchVPu9ZE+nWG1LgIK0+wSMBGOkZGJv0B6Llp7baFOQUj2fUO9t1CngH2Gxxe2ntlreU2ND9endI4T6rN+mB1mMzjj+YxkUxNdG2qllCqT1/JqcCTGylavjqToILOuVGYpC3MnzVRFKFPyrhKp4breA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717082749; c=relaxed/simple;
	bh=fd1CgIjmBOyomD+Pnh5fnNX6kDghini1LPZ3u8UMMJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Va2QU/K2mbWttKZaY74piHZJHBc8e4VX3WfG5rdB7M6fuEMZmjmhxoGyxkeOjPmS/bNBoNNCxVS+REVASGTHe/7VSymNAiHaOVQPZ9grueUnWKGOPiB4IVglNT8u42zgL5saBXBOhgxqqBAfHuVP8bjq8S1FjUjaaJbyu2gkMqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=z5CDVYIG; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6f69422c090so828439b3a.2
        for <linux-doc@vger.kernel.org>; Thu, 30 May 2024 08:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717082746; x=1717687546; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xpRgYa4dwqPbFkBgIi25CyTHChxu5ecl64Veh8E6qX4=;
        b=z5CDVYIGJaC+PaiHOtHpimys4OtLCvMq1Xt9BUH52nOFAV+n0m4vDksVaiVxw9dTpI
         frKxKTV0r8vJzMm/QWiO5/uX3zQ1QVPwubKsWADQdDCD9jPQ1zdpBeIgaVW/T9EprtfL
         Hn+GzLB1CFXHa1ABRVi7od3cXprMdWBhXRMjujapkM57HCazxof29NpONN+xO7m6g6MU
         QGLdp/Vytz9aKgZNinWw9lDG/2Py9ZCc54kUDcktkq34PmY1KqlB/lQteUWdkIaQX5H0
         3508GfU81bGwEXEbJ88tawmfBeCRlAPMNCG8FfBkfRy1rmte1o16aOX1ERfiunTxBprG
         jqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717082746; x=1717687546;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xpRgYa4dwqPbFkBgIi25CyTHChxu5ecl64Veh8E6qX4=;
        b=cN4KxMc7ZGA/SV9VZEmsWeK3ydgk8VN7nPDNW96EBYQyP46pMB6qp7cS6R8ZmAKMbl
         6F2WY+ExQcUMi1z8pcYF6nDpIgGWDBiq1ynsWIbKiRut5SQYfQNAzgwKdFsnW81MIHmf
         EWIf8F14OjAl92OWl4FFAK54Tg9LhggYY6/UD3X4xGLrUi7HTiseFs5K4PsusbiFe4d4
         SvJGNijr03mfjolKv+kwR1XUCybYkb3GmyBbLDVE89OQEOsM/iEZyMiBbhf6s8LKRjxd
         SrI8VI/qmnhbbXUzU39TkHYBmnQ4WxEUc1gH+D8RO6XQcto4k/t36iWvm+oXK/GPns7w
         flcw==
X-Forwarded-Encrypted: i=1; AJvYcCWZQJ5p3d0UX//q9fSSqYCoI7xqNNn9MN86JyIoGhgmISrkqCZbWH87oAEWUv69qBaTYgseDv4C+OtOKOqs13k3V1CrkgUPvIh3
X-Gm-Message-State: AOJu0YwfmHenmcSD0AXPf7AE6E/sN9+XyERKxELPWeIp3XtVB0v0oC1a
	HKhNByg57vk2tJoLf8E2nbnKuYwnihCJENBePluByB8xFhTiasmmxXOXZKf9bYc=
X-Google-Smtp-Source: AGHT+IEborn6L609viyJY6HL00IRTeefiOYqFrtGZGbG+Un7sype/7J809TXJhOL2x2fa0cmRNR4eg==
X-Received: by 2002:a05:6a20:5647:b0:1ad:5325:d9b7 with SMTP id adf61e73a8af0-1b26460b6bbmr2226154637.52.1717082746244;
        Thu, 30 May 2024 08:25:46 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7022b6c6047sm1848587b3a.46.2024.05.30.08.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 08:25:45 -0700 (PDT)
Date: Thu, 30 May 2024 08:25:42 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 09/16] riscv: hwprobe: export Zca, Zcf, Zcd and Zcb
 ISA extensions
Message-ID: <ZliadoA5v5obWNYn@ghost>
References: <20240517145302.971019-1-cleger@rivosinc.com>
 <20240517145302.971019-10-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240517145302.971019-10-cleger@rivosinc.com>

On Fri, May 17, 2024 at 04:52:49PM +0200, Cl�ment L�ger wrote:
> Export Zca, Zcf, Zcd and Zcb ISA extension through hwprobe.
> 
> Signed-off-by: Cl�ment L�ger <cleger@rivosinc.com>
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 20 ++++++++++++++++++++
>  arch/riscv/include/uapi/asm/hwprobe.h |  4 ++++
>  arch/riscv/kernel/sys_hwprobe.c       |  4 ++++
>  3 files changed, 28 insertions(+)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index 48be38e0b788..cad84f51412d 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -196,6 +196,26 @@ The following keys are defined:
>         supported as defined in the RISC-V ISA manual starting from commit
>         58220614a5f ("Zimop is ratified/1.0").
>  
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZCA`: The Zca extension part of Zc* standard
> +       extensions for code size reduction, as ratified in commit 8be3419c1c0
> +       ("Zcf doesn't exist on RV64 as it contains no instructions") of
> +       riscv-code-size-reduction.
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZCB`: The Zcb extension part of Zc* standard
> +       extensions for code size reduction, as ratified in commit 8be3419c1c0
> +       ("Zcf doesn't exist on RV64 as it contains no instructions") of
> +       riscv-code-size-reduction.
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZCD`: The Zcd extension part of Zc* standard
> +       extensions for code size reduction, as ratified in commit 8be3419c1c0
> +       ("Zcf doesn't exist on RV64 as it contains no instructions") of
> +       riscv-code-size-reduction.
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZCF`: The Zcf extension part of Zc* standard
> +       extensions for code size reduction, as ratified in commit 8be3419c1c0
> +       ("Zcf doesn't exist on RV64 as it contains no instructions") of
> +       riscv-code-size-reduction.
> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
>    information about the selected set of processors.
>  
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index 3b16a12204b1..652b2373729f 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -61,6 +61,10 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
>  #define		RISCV_HWPROBE_EXT_ZIHINTPAUSE	(1ULL << 36)
>  #define		RISCV_HWPROBE_EXT_ZIMOP		(1ULL << 37)
> +#define		RISCV_HWPROBE_EXT_ZCA		(1ULL << 38)
> +#define		RISCV_HWPROBE_EXT_ZCB		(1ULL << 39)
> +#define		RISCV_HWPROBE_EXT_ZCD		(1ULL << 40)
> +#define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 41)
>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index fc6f4238f0b3..11def345a42d 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -113,6 +113,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
>  		EXT_KEY(ZICOND);
>  		EXT_KEY(ZIHINTPAUSE);
>  		EXT_KEY(ZIMOP);
> +		EXT_KEY(ZCA);
> +		EXT_KEY(ZCB);
>  
>  		if (has_vector()) {
>  			EXT_KEY(ZVBB);
> @@ -133,6 +135,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
>  			EXT_KEY(ZFH);
>  			EXT_KEY(ZFHMIN);
>  			EXT_KEY(ZFA);
> +			EXT_KEY(ZCD);
> +			EXT_KEY(ZCF);
>  		}
>  #undef EXT_KEY
>  	}
> -- 
> 2.43.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


