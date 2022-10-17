Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E00E6017BC
	for <lists+linux-doc@lfdr.de>; Mon, 17 Oct 2022 21:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbiJQTeL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 17 Oct 2022 15:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbiJQTeK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Oct 2022 15:34:10 -0400
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F0813F1A;
        Mon, 17 Oct 2022 12:34:07 -0700 (PDT)
Received: from zn.tnic (p200300ea9733e793329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:9733:e793:329c:23ff:fea6:a903])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id DD66C1EC0531;
        Mon, 17 Oct 2022 21:34:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1666035242;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=A+SmiBJtXQInyL9q8CMvvRTfqz11s9Su0HRnFCAP13s=;
        b=As/Dl4Uqbukr/M8bYV5G+unu8ttU5HPzu1In68Ztxl6Xsux90JCWMYQsLahcd1FdbGFV38
        D457tUet2dDGlD4SvgQY8lPX5ya4SRNatFxvU2pw8T5B3x+QKVpHPGNeuHWKHoLD/dz30m
        Emtw31b/EA0Y9iAHG7aqgozUYBp1Nz4=
Date:   Mon, 17 Oct 2022 21:33:56 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc:     "bsingharora@gmail.com" <bsingharora@gmail.com>,
        "hpa@zytor.com" <hpa@zytor.com>,
        "Syromiatnikov, Eugene" <esyr@redhat.com>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>,
        "keescook@chromium.org" <keescook@chromium.org>,
        "Yu, Yu-cheng" <yu-cheng.yu@intel.com>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
        "Eranian, Stephane" <eranian@google.com>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "fweimer@redhat.com" <fweimer@redhat.com>,
        "nadav.amit@gmail.com" <nadav.amit@gmail.com>,
        "jannh@google.com" <jannh@google.com>,
        "dethoma@microsoft.com" <dethoma@microsoft.com>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "kcc@google.com" <kcc@google.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "oleg@redhat.com" <oleg@redhat.com>,
        "hjl.tools@gmail.com" <hjl.tools@gmail.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "Lutomirski, Andy" <luto@kernel.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "jamorris@linux.microsoft.com" <jamorris@linux.microsoft.com>,
        "Moreira, Joao" <joao.moreira@intel.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "mike.kravetz@oracle.com" <mike.kravetz@oracle.com>,
        "x86@kernel.org" <x86@kernel.org>,
        "Yang, Weijiang" <weijiang.yang@intel.com>,
        "john.allen@amd.com" <john.allen@amd.com>,
        "rppt@kernel.org" <rppt@kernel.org>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "Shankar, Ravi V" <ravi.v.shankar@intel.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
        "gorcunov@gmail.com" <gorcunov@gmail.com>
Subject: Re: [PATCH v2 05/39] x86/fpu/xstate: Introduce CET MSR and XSAVES
 supervisor states
Message-ID: <Y02uJDzi/sagFFHt@zn.tnic>
References: <20220929222936.14584-1-rick.p.edgecombe@intel.com>
 <20220929222936.14584-6-rick.p.edgecombe@intel.com>
 <Y0qBiSXdZepd7Is9@zn.tnic>
 <ea4c2081fa1498386da52931cd19b8c495d5dc6b.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ea4c2081fa1498386da52931cd19b8c495d5dc6b.camel@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 17, 2022 at 06:57:13PM +0000, Edgecombe, Rick P wrote:
> Hmm yea. Another reason the actual define is passed in is that the
> macro want's to stringify the XFEATURE define in order to generate the 
> message like this:
> XFEATURE_YMM: struct is 123 bytes, cpu state is 456 bytes
> 
> The exact format of the message is probably not too critical though. If
> instead it used xfeature_names[], it could be:
> [AVX registers]: struct is 123 bytes, cpu state is 456 bytes

Bah, "registers", that made me look at the thing. Yeah, not sure if all
those "registers" strings even matter there.

[AVX]: struct is 123 bytes, cpu state is 456 bytes

looks good enough to me too. But WTH do I know.

> The full block looks like (like you had):
> switch (nr) {
> case XFEATURE_YMM:	  return XCHECK_SZ(sz, nr, struct ymmh_struct);
> case XFEATURE_BNDREGS:	  return XCHECK_SZ(sz, nr, struct
> mpx_bndreg_state);
> case XFEATURE_BNDCSR:	  return XCHECK_SZ(sz, nr, struct
> mpx_bndcsr_state);
> case XFEATURE_OPMASK:	  return XCHECK_SZ(sz, nr, struct
> avx_512_opmask_state);
> case XFEATURE_ZMM_Hi256:  return XCHECK_SZ(sz, nr, struct
> avx_512_zmm_uppers_state);
> case XFEATURE_Hi16_ZMM:	  return XCHECK_SZ(sz, nr, struct
> avx_512_hi16_state);
> case XFEATURE_PKRU: 	  return XCHECK_SZ(sz, nr, struct pkru_state);
> case XFEATURE_PASID: 	  return XCHECK_SZ(sz, nr, struct
> ia32_pasid_state);
> case XFEATURE_XTILE_CFG:  return XCHECK_SZ(sz, nr, struct xtile_cfg);
> case XFEATURE_CET_USER:	  return XCHECK_SZ(sz, nr, struct
> cet_user_state);
> case XFEATURE_XTILE_DATA: check_xtile_data_against_struct(sz); return
> true;
> default:
> 	WARN_ONCE(1, "no structure for xstate: %d\n", nr);
> 	XSTATE_WARN_ON(1);
> 	return false;
> }
> 
> I like how it fits the XFEATURE_XTILE_DATA check in with the rest.

Yap, nice and straight-forward pattern. :)

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
