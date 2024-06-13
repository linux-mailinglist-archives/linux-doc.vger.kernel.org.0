Return-Path: <linux-doc+bounces-18505-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 455F090755C
	for <lists+linux-doc@lfdr.de>; Thu, 13 Jun 2024 16:39:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5E381F22E13
	for <lists+linux-doc@lfdr.de>; Thu, 13 Jun 2024 14:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 249AD146A60;
	Thu, 13 Jun 2024 14:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XQfERw5a"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E827214430A;
	Thu, 13 Jun 2024 14:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718289574; cv=none; b=fu/pMUHPiLWOk+cS40ZHdG7hZljzXmAuPMw6qy9Gu26Q7iLA97SxxCcYrNAzo4hPSB/cjdkb9+uQdKulZnsop5ZOrlYFb070CkixtO1idwDA0dpvzxwtnxtMl3ao19L2uoT0f3zr5m6Ny1/Fcd1ugq3uR+k96eZnBmtVHZ+AlF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718289574; c=relaxed/simple;
	bh=swE3bJ0gmQKRNPwuETGHQVmz8ewcY2VU027vWaPfDMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pvEFGCUJSl1hy+FVUAafQE2jxvaHvnqbaCOfH6WCXXxMru7/OhBvw48lHmFy55lV6A6JRhWeRG18Cs169AwnZRFaBrFOaHuwXmO9BfVFB83EubDMDbn0g9NTQiT1F3AEZbU5WQ0FNUvw8kBHbUhhuWTtO/AHiMexRrofjG24HsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XQfERw5a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D59C32786;
	Thu, 13 Jun 2024 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718289573;
	bh=swE3bJ0gmQKRNPwuETGHQVmz8ewcY2VU027vWaPfDMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XQfERw5awYE0NN+W6gQCNUDmP5JbrBVd/jrSS7EyxVCzJRwJ7D+8tto40PgxdUUDX
	 nxAGCIHQulY2k048ek5AaiYCIkj63nYzjoz2q/zcfScyEF0eTm8Xx9fC6V9cZQA2PY
	 fLpjOOu9yWr//6aK00GMVWcHjzSbuifWTDmMy3MsDXZF4S589yM4vtkR/rCNA3iA3I
	 n8DzZE/y4++ZAKXQ3fjWIpNXcyH1Gt+w/oclKwC0JiKNpxqVw7A2uKSuFOXJkSOC/B
	 kTqaPVDU8w3ONcXLNggO31WHRTNiVoWcuqrZUjDgSm5REWb68HSHlLABfU4KJoZa8p
	 97zQLCsAB/0Ow==
Date: Thu, 13 Jun 2024 15:39:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 09/13] riscv: vector: Support xtheadvector save/restore
Message-ID: <20240613-excluding-railroad-0f3128643baf@spud>
References: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
 <20240610-xtheadvector-v2-9-97a48613ad64@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0JrAeyjRXPovHSM3"
Content-Disposition: inline
In-Reply-To: <20240610-xtheadvector-v2-9-97a48613ad64@rivosinc.com>


--0JrAeyjRXPovHSM3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Andy,

On Mon, Jun 10, 2024 at 03:56:46PM -0700, Charlie Jenkins wrote:
> Use alternatives to add support for xtheadvector vector save/restore
> routines.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

Could you review this please?

Cheers,
Conor.

> ---
>  arch/riscv/include/asm/csr.h           |   6 +
>  arch/riscv/include/asm/switch_to.h     |   2 +-
>  arch/riscv/include/asm/vector.h        | 249 ++++++++++++++++++++++++++-=
------
>  arch/riscv/kernel/cpufeature.c         |   2 +-
>  arch/riscv/kernel/kernel_mode_vector.c |   8 +-
>  arch/riscv/kernel/process.c            |   4 +-
>  arch/riscv/kernel/signal.c             |   6 +-
>  arch/riscv/kernel/vector.c             |  13 +-
>  8 files changed, 222 insertions(+), 68 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 9086639a3dde..407d4a5687f5 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -30,6 +30,12 @@
>  #define SR_VS_CLEAN	_AC(0x00000400, UL)
>  #define SR_VS_DIRTY	_AC(0x00000600, UL)
> =20
> +#define SR_VS_THEAD		_AC(0x01800000, UL) /* xtheadvector Status */
> +#define SR_VS_OFF_THEAD		_AC(0x00000000, UL)
> +#define SR_VS_INITIAL_THEAD	_AC(0x00800000, UL)
> +#define SR_VS_CLEAN_THEAD	_AC(0x01000000, UL)
> +#define SR_VS_DIRTY_THEAD	_AC(0x01800000, UL)
> +
>  #define SR_XS		_AC(0x00018000, UL) /* Extension Status */
>  #define SR_XS_OFF	_AC(0x00000000, UL)
>  #define SR_XS_INITIAL	_AC(0x00008000, UL)
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/=
switch_to.h
> index 7594df37cc9f..f9cbebe372b8 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -99,7 +99,7 @@ do {							\
>  	__set_prev_cpu(__prev->thread);			\
>  	if (has_fpu())					\
>  		__switch_to_fpu(__prev, __next);	\
> -	if (has_vector())					\
> +	if (has_vector() || has_xtheadvector())		\
>  		__switch_to_vector(__prev, __next);	\
>  	if (switch_to_should_flush_icache(__next))	\
>  		local_flush_icache_all();		\
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vec=
tor.h
> index 731dcd0ed4de..6294dcaabc6a 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -18,6 +18,27 @@
>  #include <asm/cpufeature.h>
>  #include <asm/csr.h>
>  #include <asm/asm.h>
> +#include <asm/vendorid_list.h>
> +#include <asm/vendor_extensions.h>
> +#include <asm/vendor_extensions/thead.h>
> +
> +#define __riscv_v_vstate_or(_val, TYPE) ({				\
> +	typeof(_val) _res =3D _val;					\
> +	if (has_xtheadvector()) \
> +		_res =3D (_res & ~SR_VS_THEAD) | SR_VS_##TYPE##_THEAD;	\
> +	else								\
> +		_res =3D (_res & ~SR_VS) | SR_VS_##TYPE;			\
> +	_res;								\
> +})
> +
> +#define __riscv_v_vstate_check(_val, TYPE) ({				\
> +	bool _res;							\
> +	if (has_xtheadvector()) \
> +		_res =3D ((_val) & SR_VS_THEAD) =3D=3D SR_VS_##TYPE##_THEAD;	\
> +	else								\
> +		_res =3D ((_val) & SR_VS) =3D=3D SR_VS_##TYPE;		\
> +	_res;								\
> +})
> =20
>  extern unsigned long riscv_v_vsize;
>  int riscv_v_setup_vsize(void);
> @@ -40,39 +61,62 @@ static __always_inline bool has_vector(void)
>  	return riscv_has_extension_unlikely(RISCV_ISA_EXT_v);
>  }
> =20
> +static __always_inline bool has_xtheadvector_no_alternatives(void)
> +{
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_XTHEADVECTOR))
> +		return riscv_isa_vendor_extension_available(THEAD_VENDOR_ID, XTHEADVEC=
TOR);
> +	else
> +		return false;
> +}
> +
> +static __always_inline bool has_xtheadvector(void)
> +{
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_XTHEADVECTOR))
> +		return riscv_has_vendor_extension_unlikely(THEAD_VENDOR_ID,
> +							   RISCV_ISA_VENDOR_EXT_XTHEADVECTOR);
> +	else
> +		return false;
> +}
> +
>  static inline void __riscv_v_vstate_clean(struct pt_regs *regs)
>  {
> -	regs->status =3D (regs->status & ~SR_VS) | SR_VS_CLEAN;
> +	regs->status =3D __riscv_v_vstate_or(regs->status, CLEAN);
>  }
> =20
>  static inline void __riscv_v_vstate_dirty(struct pt_regs *regs)
>  {
> -	regs->status =3D (regs->status & ~SR_VS) | SR_VS_DIRTY;
> +	regs->status =3D __riscv_v_vstate_or(regs->status, DIRTY);
>  }
> =20
>  static inline void riscv_v_vstate_off(struct pt_regs *regs)
>  {
> -	regs->status =3D (regs->status & ~SR_VS) | SR_VS_OFF;
> +	regs->status =3D __riscv_v_vstate_or(regs->status, OFF);
>  }
> =20
>  static inline void riscv_v_vstate_on(struct pt_regs *regs)
>  {
> -	regs->status =3D (regs->status & ~SR_VS) | SR_VS_INITIAL;
> +	regs->status =3D __riscv_v_vstate_or(regs->status, INITIAL);
>  }
> =20
>  static inline bool riscv_v_vstate_query(struct pt_regs *regs)
>  {
> -	return (regs->status & SR_VS) !=3D 0;
> +	return !__riscv_v_vstate_check(regs->status, OFF);
>  }
> =20
>  static __always_inline void riscv_v_enable(void)
>  {
> -	csr_set(CSR_SSTATUS, SR_VS);
> +	if (has_xtheadvector())
> +		csr_set(CSR_SSTATUS, SR_VS_THEAD);
> +	else
> +		csr_set(CSR_SSTATUS, SR_VS);
>  }
> =20
>  static __always_inline void riscv_v_disable(void)
>  {
> -	csr_clear(CSR_SSTATUS, SR_VS);
> +	if (has_xtheadvector())
> +		csr_clear(CSR_SSTATUS, SR_VS_THEAD);
> +	else
> +		csr_clear(CSR_SSTATUS, SR_VS);
>  }
> =20
>  static __always_inline void __vstate_csr_save(struct __riscv_v_ext_state=
 *dest)
> @@ -81,10 +125,49 @@ static __always_inline void __vstate_csr_save(struct=
 __riscv_v_ext_state *dest)
>  		"csrr	%0, " __stringify(CSR_VSTART) "\n\t"
>  		"csrr	%1, " __stringify(CSR_VTYPE) "\n\t"
>  		"csrr	%2, " __stringify(CSR_VL) "\n\t"
> -		"csrr	%3, " __stringify(CSR_VCSR) "\n\t"
> -		"csrr	%4, " __stringify(CSR_VLENB) "\n\t"
>  		: "=3Dr" (dest->vstart), "=3Dr" (dest->vtype), "=3Dr" (dest->vl),
> -		  "=3Dr" (dest->vcsr), "=3Dr" (dest->vlenb) : :);
> +		"=3Dr" (dest->vcsr) : :);
> +
> +	if (has_xtheadvector()) {
> +		u32 tmp_vcsr;
> +		bool restore_fpu =3D false;
> +		unsigned long status =3D csr_read(CSR_SSTATUS);
> +
> +		/*
> +		 * CSR_VCSR is defined as
> +		 * [2:1] - vxrm[1:0]
> +		 * [0] - vxsat
> +		 * The earlier vector spec implemented by T-Head uses separate
> +		 * registers for the same bit-elements, so just combine those
> +		 * into the existing output field.
> +		 *
> +		 * Additionally T-Head cores need FS to be enabled when accessing
> +		 * the VXRM and VXSAT CSRs, otherwise ending in illegal instructions.
> +		 * Though the cores do not implement the VXRM and VXSAT fields in the
> +		 * FCSR CSR that vector-0.7.1 specifies.
> +		 */
> +		if ((status & SR_FS) =3D=3D SR_FS_OFF) {
> +			csr_set(CSR_SSTATUS, (status & ~SR_FS) | SR_FS_CLEAN);
> +			restore_fpu =3D true;
> +		}
> +
> +		asm volatile (
> +			"csrr	%[tmp_vcsr], " __stringify(VCSR_VXRM) "\n\t"
> +			"slliw	%[vcsr], %[tmp_vcsr], " __stringify(VCSR_VXRM_SHIFT) "\n\t"
> +			"csrr	%[tmp_vcsr], " __stringify(VCSR_VXSAT) "\n\t"
> +			"or	%[vcsr], %[vcsr], %[tmp_vcsr]\n\t"
> +			: [vcsr] "=3Dr" (dest->vcsr), [tmp_vcsr] "=3D&r" (tmp_vcsr));
> +
> +		dest->vlenb =3D riscv_v_vsize / 32;
> +
> +		if (restore_fpu)
> +			csr_set(CSR_SSTATUS, status);
> +	} else {
> +		asm volatile (
> +			"csrr	%[vcsr], " __stringify(CSR_VCSR) "\n\t"
> +			"csrr	%[vlenb], " __stringify(CSR_VLENB) "\n\t"
> +			: [vcsr] "=3Dr" (dest->vcsr), [vlenb] "=3Dr" (dest->vlenb));
> +	}
>  }
> =20
>  static __always_inline void __vstate_csr_restore(struct __riscv_v_ext_st=
ate *src)
> @@ -95,9 +178,37 @@ static __always_inline void __vstate_csr_restore(stru=
ct __riscv_v_ext_state *src
>  		"vsetvl	 x0, %2, %1\n\t"
>  		".option pop\n\t"
>  		"csrw	" __stringify(CSR_VSTART) ", %0\n\t"
> -		"csrw	" __stringify(CSR_VCSR) ", %3\n\t"
> -		: : "r" (src->vstart), "r" (src->vtype), "r" (src->vl),
> -		    "r" (src->vcsr) :);
> +		: : "r" (src->vstart), "r" (src->vtype), "r" (src->vl));
> +
> +	if (has_xtheadvector()) {
> +		u32 tmp_vcsr;
> +		bool restore_fpu =3D false;
> +		unsigned long status =3D csr_read(CSR_SSTATUS);
> +
> +		/*
> +		 * Similar to __vstate_csr_save above, restore values for the
> +		 * separate VXRM and VXSAT CSRs from the vcsr variable.
> +		 */
> +		if ((status & SR_FS) =3D=3D SR_FS_OFF) {
> +			csr_set(CSR_SSTATUS, (status & ~SR_FS) | SR_FS_CLEAN);
> +			restore_fpu =3D true;
> +		}
> +
> +		asm volatile (
> +			"srliw	%[tmp_vcsr], %[vcsr], " __stringify(VCSR_VXRM_SHIFT) "\n\t"
> +			"andi	%[tmp_vcsr], %[tmp_vcsr], " __stringify(VCSR_VXRM_MASK) "\n\t"
> +			"csrw	" __stringify(VCSR_VXRM) ", %[tmp_vcsr]\n\t"
> +			"andi	%[tmp_vcsr], %[vcsr], " __stringify(VCSR_VXSAT_MASK) "\n\t"
> +			"csrw	" __stringify(VCSR_VXSAT) ", %[tmp_vcsr]\n\t"
> +			: [tmp_vcsr] "=3D&r" (tmp_vcsr) : [vcsr] "r" (src->vcsr));
> +
> +		if (restore_fpu)
> +			csr_set(CSR_SSTATUS, status);
> +	} else {
> +		asm volatile (
> +			"csrw	" __stringify(CSR_VCSR) ", %[vcsr]\n\t"
> +			: : [vcsr] "r" (src->vcsr));
> +	}
>  }
> =20
>  static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *sav=
e_to,
> @@ -107,19 +218,33 @@ static inline void __riscv_v_vstate_save(struct __r=
iscv_v_ext_state *save_to,
> =20
>  	riscv_v_enable();
>  	__vstate_csr_save(save_to);
> -	asm volatile (
> -		".option push\n\t"
> -		".option arch, +v\n\t"
> -		"vsetvli	%0, x0, e8, m8, ta, ma\n\t"
> -		"vse8.v		v0, (%1)\n\t"
> -		"add		%1, %1, %0\n\t"
> -		"vse8.v		v8, (%1)\n\t"
> -		"add		%1, %1, %0\n\t"
> -		"vse8.v		v16, (%1)\n\t"
> -		"add		%1, %1, %0\n\t"
> -		"vse8.v		v24, (%1)\n\t"
> -		".option pop\n\t"
> -		: "=3D&r" (vl) : "r" (datap) : "memory");
> +	if (has_xtheadvector()) {
> +		asm volatile (
> +			"mv t0, %0\n\t"
> +			THEAD_VSETVLI_T4X0E8M8D1
> +			THEAD_VSB_V_V0T0
> +			"add		t0, t0, t4\n\t"
> +			THEAD_VSB_V_V0T0
> +			"add		t0, t0, t4\n\t"
> +			THEAD_VSB_V_V0T0
> +			"add		t0, t0, t4\n\t"
> +			THEAD_VSB_V_V0T0
> +			: : "r" (datap) : "memory", "t0", "t4");
> +	} else {
> +		asm volatile (
> +			".option push\n\t"
> +			".option arch, +v\n\t"
> +			"vsetvli	%0, x0, e8, m8, ta, ma\n\t"
> +			"vse8.v		v0, (%1)\n\t"
> +			"add		%1, %1, %0\n\t"
> +			"vse8.v		v8, (%1)\n\t"
> +			"add		%1, %1, %0\n\t"
> +			"vse8.v		v16, (%1)\n\t"
> +			"add		%1, %1, %0\n\t"
> +			"vse8.v		v24, (%1)\n\t"
> +			".option pop\n\t"
> +			: "=3D&r" (vl) : "r" (datap) : "memory");
> +	}
>  	riscv_v_disable();
>  }
> =20
> @@ -129,55 +254,77 @@ static inline void __riscv_v_vstate_restore(struct =
__riscv_v_ext_state *restore_
>  	unsigned long vl;
> =20
>  	riscv_v_enable();
> -	asm volatile (
> -		".option push\n\t"
> -		".option arch, +v\n\t"
> -		"vsetvli	%0, x0, e8, m8, ta, ma\n\t"
> -		"vle8.v		v0, (%1)\n\t"
> -		"add		%1, %1, %0\n\t"
> -		"vle8.v		v8, (%1)\n\t"
> -		"add		%1, %1, %0\n\t"
> -		"vle8.v		v16, (%1)\n\t"
> -		"add		%1, %1, %0\n\t"
> -		"vle8.v		v24, (%1)\n\t"
> -		".option pop\n\t"
> -		: "=3D&r" (vl) : "r" (datap) : "memory");
> +	if (has_xtheadvector()) {
> +		asm volatile (
> +			"mv t0, %0\n\t"
> +			THEAD_VSETVLI_T4X0E8M8D1
> +			THEAD_VLB_V_V0T0
> +			"add		t0, t0, t4\n\t"
> +			THEAD_VLB_V_V0T0
> +			"add		t0, t0, t4\n\t"
> +			THEAD_VLB_V_V0T0
> +			"add		t0, t0, t4\n\t"
> +			THEAD_VLB_V_V0T0
> +			: : "r" (datap) : "memory", "t0", "t4");
> +	} else {
> +		asm volatile (
> +			".option push\n\t"
> +			".option arch, +v\n\t"
> +			"vsetvli	%0, x0, e8, m8, ta, ma\n\t"
> +			"vle8.v		v0, (%1)\n\t"
> +			"add		%1, %1, %0\n\t"
> +			"vle8.v		v8, (%1)\n\t"
> +			"add		%1, %1, %0\n\t"
> +			"vle8.v		v16, (%1)\n\t"
> +			"add		%1, %1, %0\n\t"
> +			"vle8.v		v24, (%1)\n\t"
> +			".option pop\n\t"
> +			: "=3D&r" (vl) : "r" (datap) : "memory");
> +	}
>  	__vstate_csr_restore(restore_from);
>  	riscv_v_disable();
>  }
> =20
>  static inline void __riscv_v_vstate_discard(void)
>  {
> -	unsigned long vl, vtype_inval =3D 1UL << (BITS_PER_LONG - 1);
> +	unsigned long vtype_inval =3D 1UL << (BITS_PER_LONG - 1);
> =20
>  	riscv_v_enable();
> +	if (has_xtheadvector())
> +		asm volatile (THEAD_VSETVLI_X0X0E8M8D1);
> +	else
> +		asm volatile (
> +			".option push\n\t"
> +			".option arch, +v\n\t"
> +			"vsetvli	x0, x0, e8, m8, ta, ma\n\t"
> +			".option pop\n\t");
> +
>  	asm volatile (
>  		".option push\n\t"
>  		".option arch, +v\n\t"
> -		"vsetvli	%0, x0, e8, m8, ta, ma\n\t"
>  		"vmv.v.i	v0, -1\n\t"
>  		"vmv.v.i	v8, -1\n\t"
>  		"vmv.v.i	v16, -1\n\t"
>  		"vmv.v.i	v24, -1\n\t"
> -		"vsetvl		%0, x0, %1\n\t"
> +		"vsetvl		x0, x0, %0\n\t"
>  		".option pop\n\t"
> -		: "=3D&r" (vl) : "r" (vtype_inval) : "memory");
> +		: : "r" (vtype_inval));
> +
>  	riscv_v_disable();
>  }
> =20
>  static inline void riscv_v_vstate_discard(struct pt_regs *regs)
>  {
> -	if ((regs->status & SR_VS) =3D=3D SR_VS_OFF)
> -		return;
> -
> -	__riscv_v_vstate_discard();
> -	__riscv_v_vstate_dirty(regs);
> +	if (riscv_v_vstate_query(regs)) {
> +		__riscv_v_vstate_discard();
> +		__riscv_v_vstate_dirty(regs);
> +	}
>  }
> =20
>  static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstat=
e,
>  				       struct pt_regs *regs)
>  {
> -	if ((regs->status & SR_VS) =3D=3D SR_VS_DIRTY) {
> +	if (__riscv_v_vstate_check(regs->status, DIRTY)) {
>  		__riscv_v_vstate_save(vstate, vstate->datap);
>  		__riscv_v_vstate_clean(regs);
>  	}
> @@ -186,7 +333,7 @@ static inline void riscv_v_vstate_save(struct __riscv=
_v_ext_state *vstate,
>  static inline void riscv_v_vstate_restore(struct __riscv_v_ext_state *vs=
tate,
>  					  struct pt_regs *regs)
>  {
> -	if ((regs->status & SR_VS) !=3D SR_VS_OFF) {
> +	if (riscv_v_vstate_query(regs)) {
>  		__riscv_v_vstate_restore(vstate, vstate->datap);
>  		__riscv_v_vstate_clean(regs);
>  	}
> @@ -195,7 +342,7 @@ static inline void riscv_v_vstate_restore(struct __ri=
scv_v_ext_state *vstate,
>  static inline void riscv_v_vstate_set_restore(struct task_struct *task,
>  					      struct pt_regs *regs)
>  {
> -	if ((regs->status & SR_VS) !=3D SR_VS_OFF) {
> +	if (riscv_v_vstate_query(regs)) {
>  		set_tsk_thread_flag(task, TIF_RISCV_V_DEFER_RESTORE);
>  		riscv_v_vstate_on(regs);
>  	}
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 077be4ab1f9a..180f7eae9086 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -789,7 +789,7 @@ void __init riscv_fill_hwcap(void)
>  		elf_hwcap &=3D ~COMPAT_HWCAP_ISA_F;
>  	}
> =20
> -	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
> +	if (elf_hwcap & COMPAT_HWCAP_ISA_V || has_xtheadvector_no_alternatives(=
)) {
>  		riscv_v_setup_vsize();
>  		/*
>  		 * ISA string in device tree might have 'v' flag, but
> diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/k=
ernel_mode_vector.c
> index 6afe80c7f03a..99972a48e86b 100644
> --- a/arch/riscv/kernel/kernel_mode_vector.c
> +++ b/arch/riscv/kernel/kernel_mode_vector.c
> @@ -143,7 +143,7 @@ static int riscv_v_start_kernel_context(bool *is_nest=
ed)
> =20
>  	/* Transfer the ownership of V from user to kernel, then save */
>  	riscv_v_start(RISCV_PREEMPT_V | RISCV_PREEMPT_V_DIRTY);
> -	if ((task_pt_regs(current)->status & SR_VS) =3D=3D SR_VS_DIRTY) {
> +	if (__riscv_v_vstate_check(task_pt_regs(current)->status, DIRTY)) {
>  		uvstate =3D &current->thread.vstate;
>  		__riscv_v_vstate_save(uvstate, uvstate->datap);
>  	}
> @@ -160,7 +160,7 @@ asmlinkage void riscv_v_context_nesting_start(struct =
pt_regs *regs)
>  		return;
> =20
>  	depth =3D riscv_v_ctx_get_depth();
> -	if (depth =3D=3D 0 && (regs->status & SR_VS) =3D=3D SR_VS_DIRTY)
> +	if (depth =3D=3D 0 && __riscv_v_vstate_check(regs->status, DIRTY))
>  		riscv_preempt_v_set_dirty();
> =20
>  	riscv_v_ctx_depth_inc();
> @@ -208,7 +208,7 @@ void kernel_vector_begin(void)
>  {
>  	bool nested =3D false;
> =20
> -	if (WARN_ON(!has_vector()))
> +	if (WARN_ON(!(has_vector() || has_xtheadvector())))
>  		return;
> =20
>  	BUG_ON(!may_use_simd());
> @@ -236,7 +236,7 @@ EXPORT_SYMBOL_GPL(kernel_vector_begin);
>   */
>  void kernel_vector_end(void)
>  {
> -	if (WARN_ON(!has_vector()))
> +	if (WARN_ON(!(has_vector() || has_xtheadvector())))
>  		return;
> =20
>  	riscv_v_disable();
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index e4bc61c4e58a..191023decd16 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -176,7 +176,7 @@ void flush_thread(void)
>  void arch_release_task_struct(struct task_struct *tsk)
>  {
>  	/* Free the vector context of datap. */
> -	if (has_vector())
> +	if (has_vector() || has_xtheadvector())
>  		riscv_v_thread_free(tsk);
>  }
> =20
> @@ -222,7 +222,7 @@ int copy_thread(struct task_struct *p, const struct k=
ernel_clone_args *args)
>  		p->thread.s[0] =3D 0;
>  	}
>  	p->thread.riscv_v_flags =3D 0;
> -	if (has_vector())
> +	if (has_vector() || has_xtheadvector())
>  		riscv_v_thread_alloc(p);
>  	p->thread.ra =3D (unsigned long)ret_from_fork;
>  	p->thread.sp =3D (unsigned long)childregs; /* kernel sp */
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> index 5a2edd7f027e..1d5e4b3ca9e1 100644
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -189,7 +189,7 @@ static long restore_sigcontext(struct pt_regs *regs,
> =20
>  			return 0;
>  		case RISCV_V_MAGIC:
> -			if (!has_vector() || !riscv_v_vstate_query(regs) ||
> +			if (!(has_vector() || has_xtheadvector()) || !riscv_v_vstate_query(re=
gs) ||
>  			    size !=3D riscv_v_sc_size)
>  				return -EINVAL;
> =20
> @@ -211,7 +211,7 @@ static size_t get_rt_frame_size(bool cal_all)
> =20
>  	frame_size =3D sizeof(*frame);
> =20
> -	if (has_vector()) {
> +	if (has_vector() || has_xtheadvector()) {
>  		if (cal_all || riscv_v_vstate_query(task_pt_regs(current)))
>  			total_context_size +=3D riscv_v_sc_size;
>  	}
> @@ -284,7 +284,7 @@ static long setup_sigcontext(struct rt_sigframe __use=
r *frame,
>  	if (has_fpu())
>  		err |=3D save_fp_state(regs, &sc->sc_fpregs);
>  	/* Save the vector state. */
> -	if (has_vector() && riscv_v_vstate_query(regs))
> +	if ((has_vector() || has_xtheadvector()) && riscv_v_vstate_query(regs))
>  		err |=3D save_v_state(regs, (void __user **)&sc_ext_ptr);
>  	/* Write zero to fp-reserved space and check it on restore_sigcontext */
>  	err |=3D __put_user(0, &sc->sc_extdesc.reserved);
> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index 3ba2f2432483..83126995f61a 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -63,7 +63,7 @@ int riscv_v_setup_vsize(void)
> =20
>  void __init riscv_v_setup_ctx_cache(void)
>  {
> -	if (!has_vector())
> +	if (!(has_vector() || has_xtheadvector()))
>  		return;
> =20
>  	riscv_v_user_cachep =3D kmem_cache_create_usercopy("riscv_vector_ctx",
> @@ -184,7 +184,8 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
>  	u32 insn =3D (u32)regs->badaddr;
> =20
>  	/* Do not handle if V is not supported, or disabled */
> -	if (!(ELF_HWCAP & COMPAT_HWCAP_ISA_V))
> +	if (!(ELF_HWCAP & COMPAT_HWCAP_ISA_V) &&
> +	    !(has_xtheadvector() && riscv_v_vstate_ctrl_user_allowed()))
>  		return false;
> =20
>  	/* If V has been enabled then it is not the first-use trap */
> @@ -223,7 +224,7 @@ void riscv_v_vstate_ctrl_init(struct task_struct *tsk)
>  	bool inherit;
>  	int cur, next;
> =20
> -	if (!has_vector())
> +	if (!(has_vector() || has_xtheadvector()))
>  		return;
> =20
>  	next =3D riscv_v_ctrl_get_next(tsk);
> @@ -245,7 +246,7 @@ void riscv_v_vstate_ctrl_init(struct task_struct *tsk)
> =20
>  long riscv_v_vstate_ctrl_get_current(void)
>  {
> -	if (!has_vector())
> +	if (!(has_vector() || has_xtheadvector()))
>  		return -EINVAL;
> =20
>  	return current->thread.vstate_ctrl & PR_RISCV_V_VSTATE_CTRL_MASK;
> @@ -256,7 +257,7 @@ long riscv_v_vstate_ctrl_set_current(unsigned long ar=
g)
>  	bool inherit;
>  	int cur, next;
> =20
> -	if (!has_vector())
> +	if (!(has_vector() || has_xtheadvector()))
>  		return -EINVAL;
> =20
>  	if (arg & ~PR_RISCV_V_VSTATE_CTRL_MASK)
> @@ -306,7 +307,7 @@ static struct ctl_table riscv_v_default_vstate_table[=
] =3D {
> =20
>  static int __init riscv_v_sysctl_init(void)
>  {
> -	if (has_vector())
> +	if (has_vector() || has_xtheadvector())
>  		if (!register_sysctl("abi", riscv_v_default_vstate_table))
>  			return -EINVAL;
>  	return 0;
>=20
> --=20
> 2.44.0
>=20

--0JrAeyjRXPovHSM3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmsEngAKCRB4tDGHoIJi
0qAUAP4jr3nfvm9r65RMFXBVkMCUPuH+ECjIM/94fFSimh+qrgD6A/bVQs/VMrSA
2B54KBuDGJhGOjksuw3wDvjrnN07Cwc=
=0Nqx
-----END PGP SIGNATURE-----

--0JrAeyjRXPovHSM3--

