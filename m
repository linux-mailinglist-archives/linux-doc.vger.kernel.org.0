Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63D7560292B
	for <lists+linux-doc@lfdr.de>; Tue, 18 Oct 2022 12:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbiJRKNP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 18 Oct 2022 06:13:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbiJRKNN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Oct 2022 06:13:13 -0400
Received: from xry111.site (xry111.site [89.208.246.23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32D8FB40C6
        for <linux-doc@vger.kernel.org>; Tue, 18 Oct 2022 03:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
        s=default; t=1666087979;
        bh=MHffDb9nz5SlTKrFRdSZ5pnRlJuC9ciIbmRlczVfjIQ=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=i1+tNZ/RtdQOAdaovLpKg4c1Dkq/CugOAiVDmFSsrvJIR3hSiDEb970OWYaJqeqSn
         OAm2DrUH+pGVvLo5Fn8P1YDWKiFDIxXZMu10eNDqP3WJ0o7a8+S69ApmCAnfa0UwoC
         aYCcNGSzRD11QqVr+ck0F+8jCsCIsIUduFGyqufI=
Received: from [IPv6:240e:358:1124:a900:dc73:854d:832e:3] (unknown [IPv6:240e:358:1124:a900:dc73:854d:832e:3])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
        (Client did not present a certificate)
        (Authenticated sender: xry111@xry111.site)
        by xry111.site (Postfix) with ESMTPSA id 11D8D65DBF;
        Tue, 18 Oct 2022 06:12:54 -0400 (EDT)
Message-ID: <3df303d1b0196a62217f6d034c0375855d77e04b.camel@xry111.site>
Subject: Re: [PATCH 1/2] Documentation: LoongArch: Document the syscall ABI
From:   Xi Ruoyao <xry111@xry111.site>
To:     WANG Xuerui <kernel@xen0n.name>, linux-doc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>, Huacai Chen <chenhuacai@kernel.org>,
        Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, loongarch@lists.linux.dev
Date:   Tue, 18 Oct 2022 18:12:48 +0800
In-Reply-To: <20221018100457.3440691-2-kernel@xen0n.name>
References: <20221018100457.3440691-1-kernel@xen0n.name>
         <20221018100457.3440691-2-kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.0 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 2022-10-18 at 18:04 +0800, WANG Xuerui wrote:

/* snip */


> +The system call number is placed in the register ``a7``.
> +Parameters, if present, are placed from ``a0`` through ``a6`` as needed,
> +as if calling a function with the respective arguments.
> +Upon return, ``a0`` contains the return value, and ``t0-t8`` should be
> +considered clobbered; all other registers are preserved.

Hmm, are a1-a7 guaranteed to be preserved?

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
