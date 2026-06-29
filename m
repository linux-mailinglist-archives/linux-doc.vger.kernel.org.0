Return-Path: <linux-doc+bounces-93981-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KiT/B4ZaQmol5QkAu9opvQ
	(envelope-from <linux-doc+bounces-93981-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 13:44:06 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 687DB6D9937
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 13:44:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Z+0/8IVN";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93981-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93981-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 543C5300F112
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 11:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8E23B8948;
	Mon, 29 Jun 2026 11:28:46 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980AE3644C1
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 11:28:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732526; cv=none; b=suINR9t555MOItiALMXW+H7jChQSiLTQABtL/SjZ72/UUijGEtUdLuB4LqKwWrFTuWIMytFJftxdiwxOUnScE9Lvdt9eoeIgdfi5xK2j/CLbLbEhDgedTw8KmCdu2WFJfKdk/IX4GGksfl7geiU8gji13xoZuOrCGvekNFMfM1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732526; c=relaxed/simple;
	bh=VScsbI2kLcswloPr3kiwqADGVDsXFCoZ45B/FNKe4Lk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QUfclaC6utCvsS2LzWGcATUutx9zaBUs7s9cq5KJzCtOpfum6//yZTfQ9kpewMl7VILOsiX7OXNjrG2k64SCzfOn9gdDyRYdth/cvoa4P59VrQ0YoXGUszEPpLfFFZRkA4y/oT1ht86yaR4kqXkTkFvonJ7IyD6jrIgm1f9WAbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+0/8IVN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3831A1F00A3D
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 11:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782732525;
	bh=2SGF5N2MQo78vGzqyV7/apPuXFO2rP32pwgUlpuOhCM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Z+0/8IVNPNzLaX+cAHumKXyLIGetyMOrlba45W400NLvAFGsm1b4czPFceeKYdEUa
	 g8HgTaWUDgmu+CZyz3EYnoBr6ox7+YRsFbnFoiNC8XayyFYh0MRYaWjMrn6l3LeZT8
	 pKJ0WR8FO6dz/tYWm5ULT+k33cQLB7RhKgRnIXSyXT3zQ9EEmyaIaMeuCH8hyerZ4S
	 g4rRsM3VRgwuReJJdH3T8aVxHhqwOStoWfx5LYMYR1pit6hvseU0QkJaex3qBeJIPn
	 /SMntij8ibUAP9GYL5bpLF5RJkODA334aMwug2ZyKIGeZnOJRRtFLZstcI9XaBpo/b
	 ih6xxN0jsRAtA==
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-474bf35cccdso111749f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 04:28:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqmtWQkmS5gx29cq7dD04PXTPyE6X8PYrymqPy2jGn/xZmV27pYseJHwpf8To+yJUVzf+AT6Uekm6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEsfJoMDdn8fkRsvYr7axq7JNctJQsVVcQnX76vzRXu9aouhOd
	7qUgdsivFcF5/+iuC5xLE249MM3ahk9+C6ErWXNsQWzViSgmIK1dSYjg88fCd68vYngZvBko8YU
	wutx1Y0A7JKl6YlNnbzsZpfFxCtTDvfM=
X-Received: by 2002:a05:6000:2c03:b0:464:79f0:9162 with SMTP id
 ffacd0b85a97d-474ff09dd29mr78407f8f.19.1782732523175; Mon, 29 Jun 2026
 04:28:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629094746.191843-1-ruanjinjie@huawei.com> <20260629094746.191843-7-ruanjinjie@huawei.com>
In-Reply-To: <20260629094746.191843-7-ruanjinjie@huawei.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 29 Jun 2026 19:28:27 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS5xMdFcuYBd2d+jvZTTSAJ_A6Eid0LqB-3WVAcT4NptA@mail.gmail.com>
X-Gm-Features: AVVi8Cfb_YoOBZUDhpGGsfHfl7o1RJdl6tur8fEdDE_oRtNsU4-e7q_E2QvES68
Message-ID: <CAJF2gTS5xMdFcuYBd2d+jvZTTSAJ_A6Eid0LqB-3WVAcT4NptA@mail.gmail.com>
Subject: Re: [PATCH v17 06/10] riscv: kexec_file: Use crash_prepare_headers()
 helper to simplify code
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org, 
	saravanak@kernel.org, akpm@linux-foundation.org, baoquan.he@linux.dev, 
	rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org, 
	ruirui.yang@linux.dev, rdunlap@infradead.org, peterz@infradead.org, 
	feng.tang@linux.alibaba.com, dapeng1.mi@linux.intel.com, elver@google.com, 
	enelsonmoore@gmail.com, kuba@kernel.org, ebiggers@kernel.org, 
	lirongqing@baidu.com, leitao@debian.org, kees@kernel.org, coxu@redhat.com, 
	cfsworks@gmail.com, jbohac@suse.cz, osandov@fb.com, ryan.roberts@arm.com, 
	tangyouling@kylinos.cn, sourabhjain@linux.ibm.com, ritesh.list@gmail.com, 
	gaohan@iscas.ac.cn, david@kernel.org, wangruikang@iscas.ac.cn, 
	muchun.song@linux.dev, vishal.moola@gmail.com, junhui.liu@pigmoral.tech, 
	namcao@linutronix.de, rick.p.edgecombe@intel.com, djbw@kernel.org, 
	liaoyuanhong@vivo.com, fuqiang.wang@easystack.cn, vishal.l.verma@intel.com, 
	chenjiahao16@huawei.com, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,linux.dev,soleen.com,infradead.org,linux.alibaba.com,google.com,baidu.com,debian.org,suse.cz,fb.com,kylinos.cn,iscas.ac.cn,pigmoral.tech,linutronix.de,intel.com,vivo.com,easystack.cn,huawei.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-93981-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[guoren@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ruanjinjie@huawei.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:robh@kernel.org,m:saravanak@kernel.org,m:akpm@linux-foundation.org,m:baoquan.he@linux.dev,m:rppt@kernel.org,m:pasha.tatashin@soleen.com,m:pratyush@kernel.org,m:ruirui.yang@linux.dev,m:rdunlap@infradead.org,m:peterz@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:elver@google.com,m:enelsonmoore@gmail.com,m:kuba@kernel.org,m:ebiggers@kernel.org,m:lirongqing@baidu.com,m:leitao@debian.org,m:kees@kernel.org,m:coxu@redhat.com,m:cfsworks@gmail.com,m:jbohac@suse.cz,m:osandov@fb.com,m:ryan.roberts@arm.com,m:tangyouling@kylinos.cn,
 m:sourabhjain@linux.ibm.com,m:ritesh.list@gmail.com,m:gaohan@iscas.ac.cn,m:david@kernel.org,m:wangruikang@iscas.ac.cn,m:muchun.song@linux.dev,m:vishal.moola@gmail.com,m:junhui.liu@pigmoral.tech,m:namcao@linutronix.de,m:rick.p.edgecombe@intel.com,m:djbw@kernel.org,m:liaoyuanhong@vivo.com,m:fuqiang.wang@easystack.cn,m:vishal.l.verma@intel.com,m:chenjiahao16@huawei.com,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:devicetree@vger.kernel.org,m:kexec@lists.infradead.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoren@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[69];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,huawei.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,dabbelt.com:email,berkeley.edu:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 687DB6D9937

On Mon, Jun 29, 2026 at 5:48=E2=80=AFPM Jinjie Ruan <ruanjinjie@huawei.com>=
 wrote:
>
> Use the newly introduced crash_prepare_headers() function to replace
> the existing prepare_elf_headers(), allocate cmem and exclude crash kerne=
l
> memory in the crash core, which reduce code duplication.
>
> Only the following two architecture functions need to be implemented:
> - arch_get_system_nr_ranges(). Call get_nr_ram_ranges_callback()
>   to pre-counts the max number of memory ranges.
>
> - arch_crash_populate_cmem(). Use prepare_elf64_ram_headers_callback()
>   to collects the memory ranges and fills them into cmem.
>
> Cc: Paul Walmsley <pjw@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Alexandre Ghiti <alex@ghiti.fr>
> Cc: Guo Ren <guoren@kernel.org>
> Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Acked-by: Baoquan He <bhe@redhat.com>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/riscv/kernel/machine_kexec_file.c | 47 +++++++-------------------
>  1 file changed, 12 insertions(+), 35 deletions(-)
>
> diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/m=
achine_kexec_file.c
> index fa2946aa9b8f..1dfb1d9eb691 100644
> --- a/arch/riscv/kernel/machine_kexec_file.c
> +++ b/arch/riscv/kernel/machine_kexec_file.c
> @@ -45,6 +45,15 @@ static int get_nr_ram_ranges_callback(struct resource =
*res, void *arg)
>         return 0;
>  }
>
> +unsigned int arch_get_system_nr_ranges(void)
> +{
> +       unsigned int nr_ranges =3D 2; /* For exclusion of crashkernel reg=
ion */
> +
> +       walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback=
);
> +
> +       return nr_ranges;
> +}
> +
>  static int prepare_elf64_ram_headers_callback(struct resource *res, void=
 *arg)
>  {
>         struct crash_mem *cmem =3D arg;
> @@ -56,41 +65,9 @@ static int prepare_elf64_ram_headers_callback(struct r=
esource *res, void *arg)
>         return 0;
>  }
>
> -static int prepare_elf_headers(void **addr, unsigned long *sz)
I agree to make arch_crash_populate_cmem more generic, and leave
arch_crash_populate_cmem & prepare_elf64_ram_headers_callback here as
callbacks.

Reviewed-by: Guo Ren <guoren@kernel.org>

> +int arch_crash_populate_cmem(struct crash_mem *cmem)
>  {
> -       struct crash_mem *cmem;
> -       unsigned int nr_ranges;
> -       int ret;
> -
> -       nr_ranges =3D 2; /* For exclusion of crashkernel region */
> -       walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback=
);
> -
> -       cmem =3D kmalloc_flex(*cmem, ranges, nr_ranges);
> -       if (!cmem)
> -               return -ENOMEM;
> -
> -       cmem->max_nr_ranges =3D nr_ranges;
> -       cmem->nr_ranges =3D 0;
> -       ret =3D walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_header=
s_callback);
> -       if (ret)
> -               goto out;
> -
> -       /* Exclude crashkernel region */
> -       ret =3D crash_exclude_mem_range(cmem, crashk_res.start, crashk_re=
s.end);
> -       if (ret)
> -               goto out;
> -
> -       if (crashk_low_res.end) {
> -               ret =3D crash_exclude_mem_range(cmem, crashk_low_res.star=
t, crashk_low_res.end);
> -               if (ret)
> -                       goto out;
> -       }
> -
> -       ret =3D crash_prepare_elf64_headers(cmem, true, addr, sz);
> -
> -out:
> -       kfree(cmem);
> -       return ret;
> +       return walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers=
_callback);
>  }
>
>  static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
> @@ -282,7 +259,7 @@ int load_extra_segments(struct kimage *image, unsigne=
d long kernel_start,
>         if (image->type =3D=3D KEXEC_TYPE_CRASH) {
>                 void *headers;
>                 unsigned long headers_sz;
> -               ret =3D prepare_elf_headers(&headers, &headers_sz);
> +               ret =3D crash_prepare_headers(true, &headers, &headers_sz=
, NULL);
>                 if (ret) {
>                         pr_err("Preparing elf core header failed\n");
>                         goto out;
> --
> 2.34.1
>


--=20
Best Regards
 Guo Ren

