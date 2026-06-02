Return-Path: <linux-doc+bounces-90551-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id axIhN60LH2pmeQAAu9opvQ
	(envelope-from <linux-doc+bounces-90551-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 18:58:21 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FD26306EF
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 18:58:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Z/MLWywZ";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90551-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90551-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4B04530161B2
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2026 16:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD70374187;
	Tue,  2 Jun 2026 16:44:36 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C047375F69
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 16:44:35 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780418676; cv=pass; b=gjCcKkFlp17rB3iN7AQLcXDjGt+hfIFEGD7bS+6aV8WlgsN+l/KD4votEb7WAM+36bnqIO7nDfDA41fgKrEkb7MgYJ4lcqbwf5yv/DthdMxoAo34pWR6h9BdE7jAPrXePlaw9QTcvy7o9GpzbMYws1cdWR+d7vyLPQfBHhmPOYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780418676; c=relaxed/simple;
	bh=H4X7GafgGytW9rIihOEjdmCsRPquH699r4PT+HiQB7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OHFCbNS77lanHTFQM06Hptbact6kCT3O+1ttCRy7ntI7iszxRvuC/ZKyOm3++8iGfEemMVg2J8YomPbxwdEJrRzhebUao0nRBXxEoNeBnkt63evUr8qmml9lNhCq4eAaSHCiSZTxN4xW9fIGGX8HCPJIIkPj1yg6bh1NnwlbkP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/MLWywZ; arc=pass smtp.client-ip=209.85.215.175
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c8587427468so1296430a12.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 09:44:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780418675; cv=none;
        d=google.com; s=arc-20240605;
        b=hVG5lGMI1OQl9YWBY9BGrvUkBlxDvkeHP1QYeFn9NYcTPpIf488RSywAHB9duJRFhz
         Nwmon9/rj4zzRy7T9zdG+3Ad4rv9Bj4bEUeeTsbbZTETCUKAh010n1dkMrvGzL/YBfwJ
         VRaDvV5lgctL29T/H+rYD20mtigIosaFmdXOfB+FpwOB77n87pLcuf+CP0gJqiQYiX+z
         LvWVFiWT9MUgkleKa6Q8pRj+kH4tgQwsLaZ7REQm30HsF/Cw3yF1M4P4jJ7UmPb4Hfit
         MLFAXd2UJhaeb8LqofGCfSwyKgPSSyH6t5bFWC8YHVsALTRo04wRIwoe6QOx0KEmq82y
         7lHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H4X7GafgGytW9rIihOEjdmCsRPquH699r4PT+HiQB7M=;
        fh=kvYGRPjFoOpN3lzsiIFqS/26YC5MVHY+Pp1JwwjP+x4=;
        b=LYm51673cYo1fEYwz5vqCksesnbOdfeswS/s5b56UI7X64sAR7jjB3tD8MTPa0Js5N
         jPeDvdalttdrx4N4VxV3SHXdtlLS0FWZw15zGgnui56OBJaEgVsmeN8ll7SsPOec8B+O
         FjynIQi8iOhwKNQX4MY5rSAuAhhi8v84e9wmdMe3ImjrPCcoY3GIPW/LUHfixFNBlGGu
         eCHqXFzZJF4qLXxEhF6ANR26iwWIc7FY6Kixcn/hS2M8wWvUQkU9FsXvo0SFDRnCSVvz
         WUJ6ManRDFy0E93U905FzOv8rjl5InlRUPkeYCM6t00NNUZ7X+L5pvMreHh7NukXxsyV
         pn4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780418675; x=1781023475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4X7GafgGytW9rIihOEjdmCsRPquH699r4PT+HiQB7M=;
        b=Z/MLWywZCoC+QfNtiLgLj8EU9clq8bFIxzJ0/mif0iP1sT4BNdoD9a4CVY5+z9OgUV
         PSvnvN6MyrDysnHrwm0pc8sPddccsqGgOYg4ZKRi8YOXX9qHNZFaiL5/SQZixPB1cHI1
         Cl3SydJdOWqBaYjZF0kHYrRx6aUps0S8PzmqLrQ5gwYbIi1Z9/MgS6l1nRWZ7v2jFx/H
         kAHQgpebijwxtsQaDIFTQ+iyI6gcCn3DtkkCKO3ZxDS4SwH2RJEHe03UV+nLlx7SOOAH
         X16LqJqtGjRJL6/YHt7S9RRJ/mkRUibKWeaNI9XhngN5FbtwCLrODBZyKanOdRxq2WRT
         5MvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780418675; x=1781023475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H4X7GafgGytW9rIihOEjdmCsRPquH699r4PT+HiQB7M=;
        b=qFKJ7KOQCyyKZbQ4d+e98KLHHPicWNqUEl1udndzPxLaguHyZypqT2m7Cg9elNB5Iv
         6PrC+KuXYoMWcPTwXVG4Va8YxWjEK0dS1U8eXrD/EPK18plzFaLr8FdiSv0S7FP9HA4Q
         XJRx5f7fFY6/TS1zraGJUtw+hcwPnUyfZLjCjeqyPqzn/JHYgHOSh7pcsXMUJdc57yjv
         MgkOqtD2OVUu+oKdI9orgg2gizupm4ukANFmwTNU+3TdtyBZgtOkfX7pMHVO8tktGxsf
         C55bgcPhszsYvuVRgoyrQVUA7B/AaonL+G96NT0SaPHaeJKdzx9nz/obPgYSt1xaduok
         NGjw==
X-Forwarded-Encrypted: i=1; AFNElJ+k32zUiTQxSVvMcdNg15Dafg+daWk2kxYiYLoMIpjWFj8azZeSVIQEYAaWOloBtgFxOY9ZXCyMLVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMQ+1TgEsn+YsBTpY0s2Q1SroL2vnrN6pwTGu2RlqBEGeaDKOc
	vHtCvwq8/GTcWwtOKntupRF4hNhWwvVnAsJ3Dt4h5fVptNlNhahXzfgGPoKViBSRu+ZbKl7hk8y
	cbcXfCpxN3ScDlOPpqq/oxttw/PdifbE=
X-Gm-Gg: Acq92OHRMCJu+KEuO3xdTIIJMWzfYnsh5/n+HggU7DXA9JE35wl2QIB2yFyiVgw0JZn
	I9Jl/bI5zQYZjz+BHwd7mIaK5oylHNSVX24iU7xS95ICgHnBddpyKfvm+0O/N+gyNopPCIzyUdP
	263V0kNOXUkFkzI936lV263ep6NyHPMueR1K8kmJaVSd6Ei8isAxoCl6LJUOspdw8OOYeTvpRu8
	3A811PfkRDx/hh6Vvkk44DWtQO1vUabZbxikFtgrN4M2SX4GPunxxHV2bDv/Tt8zP32Llj2ixcM
	qptPcocrDCElfM8v/K4QDvxpPub6v8qnx3XrEu/1mYpUrGEhKMo=
X-Received: by 2002:a05:6a20:6a0f:b0:39b:dea7:5624 with SMTP id
 adf61e73a8af0-3b494703049mr283643637.47.1780418674638; Tue, 02 Jun 2026
 09:44:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528212955.1912856-1-nphamcs@gmail.com> <ahz_iYG4lqWL4g-J@KASONG-MC4>
 <CAKEwX=PzMwXXgq=ULAkFD9UqMz+ewLqhKt+xdGxkV7OmA2QG6w@mail.gmail.com>
 <CAKEwX=NNNf0KCZC0ph7VRW0gjnbXd4W5NKEaHM4XzPdN03Ek3A@mail.gmail.com>
 <CAMgjq7CT0ccCnzmpRGjTGPnNEn4eK==5A-OFbr3+p465dQMH4A@mail.gmail.com> <CAKEwX=M3WAkSY=Zd35dEuQ6V3ZiNR02bKAN_DnCgVr69w9=0sQ@mail.gmail.com>
In-Reply-To: <CAKEwX=M3WAkSY=Zd35dEuQ6V3ZiNR02bKAN_DnCgVr69w9=0sQ@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 3 Jun 2026 00:43:56 +0800
X-Gm-Features: AVHnY4KpeXrvhgct7XamiE1lkAmJNELAfrV_3bpnCb4RsNbEUjdlDb9oJ5aU_SQ
Message-ID: <CAMgjq7DspvGR-2V6Go6tpCwBTWc9-pwK3WhMUoanWBAijmuypw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] mm, swap: Virtual Swap Space (Swap Table Edition)
To: Nhat Pham <nphamcs@gmail.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, apopple@nvidia.com, 
	axelrasmussen@google.com, baohua@kernel.org, baolin.wang@linux.alibaba.com, 
	bhe@redhat.com, byungchul@sk.com, cgroups@vger.kernel.org, 
	chengming.zhou@linux.dev, chrisl@kernel.org, corbet@lwn.net, david@kernel.org, 
	dev.jain@arm.com, gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, 
	jannh@google.com, joshua.hahnjy@gmail.com, lance.yang@linux.dev, 
	lenb@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-pm@vger.kernel.org, lorenzo.stoakes@oracle.com, 
	matthew.brost@intel.com, mhocko@suse.com, muchun.song@linux.dev, 
	npache@redhat.com, pavel@kernel.org, peterx@redhat.com, peterz@infradead.org, 
	pfalcato@suse.de, rafael@kernel.org, rakie.kim@sk.com, 
	roman.gushchin@linux.dev, rppt@kernel.org, ryan.roberts@arm.com, 
	shakeel.butt@linux.dev, shikemeng@huaweicloud.com, surenb@google.com, 
	tglx@kernel.org, vbabka@suse.cz, weixugc@google.com, 
	ying.huang@linux.alibaba.com, yosry.ahmed@linux.dev, yuanchu@google.com, 
	zhengqi.arch@bytedance.com, ziy@nvidia.com, kernel-team@meta.com, 
	riel@surriel.com, haowenchao22@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90551-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nphamcs@gmail.com,m:Liam.Howlett@oracle.com,m:akpm@linux-foundation.org,m:apopple@nvidia.com,m:axelrasmussen@google.com,m:baohua@kernel.org,m:baolin.wang@linux.alibaba.com,m:bhe@redhat.com,m:byungchul@sk.com,m:cgroups@vger.kernel.org,m:chengming.zhou@linux.dev,m:chrisl@kernel.org,m:corbet@lwn.net,m:david@kernel.org,m:dev.jain@arm.com,m:gourry@gourry.net,m:hannes@cmpxchg.org,m:hughd@google.com,m:jannh@google.com,m:joshua.hahnjy@gmail.com,m:lance.yang@linux.dev,m:lenb@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pm@vger.kernel.org,m:lorenzo.stoakes@oracle.com,m:matthew.brost@intel.com,m:mhocko@suse.com,m:muchun.song@linux.dev,m:npache@redhat.com,m:pavel@kernel.org,m:peterx@redhat.com,m:peterz@infradead.org,m:pfalcato@suse.de,m:rafael@kernel.org,m:rakie.kim@sk.com,m:roman.gushchin@linux.dev,m:rppt@kernel.org,m:ryan.roberts@arm.com,m:shakeel.butt@linux.dev,m:shikemeng@huaweicloud.com,m:surenb@google.com,m:tg
 lx@kernel.org,m:vbabka@suse.cz,m:weixugc@google.com,m:ying.huang@linux.alibaba.com,m:yosry.ahmed@linux.dev,m:yuanchu@google.com,m:zhengqi.arch@bytedance.com,m:ziy@nvidia.com,m:kernel-team@meta.com,m:riel@surriel.com,m:haowenchao22@gmail.com,m:joshuahahnjy@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[ryncsn@gmail.com,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[oracle.com,linux-foundation.org,nvidia.com,google.com,kernel.org,linux.alibaba.com,redhat.com,sk.com,vger.kernel.org,linux.dev,lwn.net,arm.com,gourry.net,cmpxchg.org,gmail.com,kvack.org,intel.com,suse.com,infradead.org,suse.de,huaweicloud.com,suse.cz,bytedance.com,meta.com,surriel.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[54];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ryncsn@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2FD26306EF

On Tue, Jun 2, 2026 at 11:54=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Mon, Jun 1, 2026 at 10:49=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wr=
ote:
> >
> >
> > That part should be indeed coverable by the si->percpu cluster though, =
I think.
>
> Yeah agree - we just need to be a bit craftier with it. The
> fundamental problem is in the current model, we're only storing offset
> and si, then look up cluster based on that. But for dynamic vswap,
> that look up takes the xa_load().
>
> Once we move to per-si per-cpu cluster, then I think it becomes ok to
> store the cluster pointer directly, correct?
>
> The reference counting needs to be carefully handled though. I think
> in my old vss design I did something fairly silly - just hold a
> reference to it while it's in cache, then add CPU offlining handler to
> clean up. Not the end of the world I suppose, but maybe there's a
> smarter scheme.

Yeah... I'm not entirely sure about this at this point, maybe it can
be sorted out as we process. Maybe we can also avoid the xa_load with
other techniques too.

