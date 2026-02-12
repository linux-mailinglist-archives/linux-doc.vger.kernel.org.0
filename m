Return-Path: <linux-doc+bounces-75930-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMyRHEkQjmkM/AAAu9opvQ
	(envelope-from <linux-doc+bounces-75930-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 12 Feb 2026 18:39:21 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 990CE130011
	for <lists+linux-doc@lfdr.de>; Thu, 12 Feb 2026 18:39:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CFB5A300B8E8
	for <lists+linux-doc@lfdr.de>; Thu, 12 Feb 2026 17:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B89925A334;
	Thu, 12 Feb 2026 17:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJ002zIr"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33611258CE5
	for <linux-doc@vger.kernel.org>; Thu, 12 Feb 2026 17:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770917956; cv=pass; b=QiFKKTJ4Q3JPv08iXk9aQ6opelY5ICTYzrH/rEJmBKns56Mg9kxW5RCifZwBubH+uZ1Z5DuAOcxs23AHDOC+A/NaC2+ZmAQI6KY65mZMQRVein+iwEwsqPagnTiT0EfOQzu7u92wV8Lu750I7fO9RYReECYh5NRirJZVTOGHe5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770917956; c=relaxed/simple;
	bh=PmDSu9rHdkQKCyukTIemQGDTasI1Oy6wKb2WDyCVFJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RQu0Ig6yPmyKNpTIrHwwRS9oK/8sJkC1HBxFP1j+uszwN33vsMhMVUtx7oNdLnBo8OAGiA9G/LwFg6Zt5/4ZVj8peSQHJXEy+McyetQyJr1Bu97PJsMJ7udeuPxE/Val9rb5z70OoQZYdGyBnYpVzv+OVxWGzdgTCxyXwHBS+h8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJ002zIr; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48336a6e932so600005e9.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Feb 2026 09:39:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770917954; cv=none;
        d=google.com; s=arc-20240605;
        b=gv/J0EG20W5vb73DrH0YnTh9dfuLZE6NZTGHkFcnYekyYx6E8Yu4g8BeUctgRYpiNm
         D/dypQeMQUICLJ3de8v6h2ywvvSJFlim5AL55/7EvgPqYTVANXPkOAE7pbG/b2yG052z
         fq3BncDXzzkXYiZLdF0xwqhSUbKwOOW+F/wq9HzdJOLqSbh41mZhVxGKw/Uh9U/SAf6N
         bIB5GvEHUEjGyvcuo9jNrdK2r7uuC9aSiZ7PSeXKb6sE4jaz1vjOQVUiLpALemUPfQoS
         ayZ33on/67brkK0umLGFw+fSlZFtO2g5FcERB32lvNImkQ11IXFiPZJu+EP99OKGmfgI
         E56A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PmDSu9rHdkQKCyukTIemQGDTasI1Oy6wKb2WDyCVFJM=;
        fh=kHhDC+14rPWBMmqlBy1TyFdcgsBa/bUZfrlA0qTQEjA=;
        b=VjAsQKFq5lOcv5VbZi8U0GmurBiHws3wrVeVDINFq4IJIOKN9HeQRs9SExc9n315tk
         TJhJ6GMynzU7l75A24nHnj7OA2vByr3r6oCi6NpYXVkBWNbqzRBk5qx5qozCOw7T6x8n
         LH7Dd98zOSbmDW6JOtpaNLioFsvf7v1RGQEljJ2zrRnnXy7VhJQnRLzmJciXMKD1jwP7
         0hjvfz2em7uWe3pGJirmNYKxizvOUUUFpdevnu1R+Zt8Z8kxDmv3Bbiql4LOwTY/I0Rs
         1YjtJgWgCoeKOPPAfQcYhsB/xrc2Pdy0qW2iR6JNiqAHZZfqmmXC0JUY3BeaVU3mWD6e
         ar2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770917954; x=1771522754; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmDSu9rHdkQKCyukTIemQGDTasI1Oy6wKb2WDyCVFJM=;
        b=VJ002zIrSGN0A6MqtaKVxxFHhMWJHZLF62T013hbmajgRuiCB/RrRvYPUuXR8lW88U
         wMPATjWmk3EafYrGU5JK6KjGjdsWwJiI0xURqiHd9ln7Ih+plAe3iGXyTjQCBNU0CK7E
         vqtG7iCL9D4VZTHTOAUfdg2cjeFFVh7cagy7KZgKO9OreUuiqlzoTWn1ybTU+RvCCsGZ
         dY1aDpSAczaUoZHEzO81akbrwEqSf5S5UFt6Bmvcm3a1g+wfp2HQDtzsTr8yr7LNDh6R
         3mUIuJjdS37JC/VkREUQdbVntjUfZK7GRMnBUTK5ZCdg2QXCPClI4Or0P7suCldW1dvD
         Gq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770917954; x=1771522754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PmDSu9rHdkQKCyukTIemQGDTasI1Oy6wKb2WDyCVFJM=;
        b=pBZVPoqP6+x2VzS/p12Fv+Ec/SV5Xq5dOUxYKtqDgKe7NvyPSxXK2KmiJHlM5hbqJ/
         tlp1nw4WAE7SxBDUkdwCQ20VcEUDlji4ltVTWyZ50fDwLhhF5OaWyq485wOu4xT3GtCn
         hC68U604seLLBsQ6Dp3yd2U3ZEkFrsqZQXZo9Z5zTE+GWv/cYq3oMpY5ikz71CpTmOCV
         nJKFMAHOL+nPWlTWFp/ujrF0gdG9JZP19rcFO4qgHGc0VJC1SJUSZHYO5Ej2cdCdkH52
         QTcVnY0K46J8BtFQFckF39Dsb73/EU/CBc77/lQuQ+AQmHNjfLraZZTZP0ok6zEEymdW
         5hbg==
X-Forwarded-Encrypted: i=1; AJvYcCXKRjP58yRg3z/MGSfVw/PesGpTodT3rYMahrn6T66+iY9bExN5g5yE2elcS9iTTfTtpL4bMVEQhvM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv20jsKOgrKGvcIFEaeVTm+ODsReYoIkxaXYQMTxVp1y3wHD3n
	NEOVdszM8Gn3fsu9iPhymM1pa57sxsUF4xbOTr9qqJh8bpjYwd5j5aJewx91EPGhYpkUlJ9b8e7
	HaHK/Uqp4vhxcRzV1n5ZU2v+HG/37cZ0=
X-Gm-Gg: AZuq6aJlxxnSvWdj2f1Q+Zm1ka+2vi6gEC9WFZhLJm69gFaSL2v9XQbqfdag23eZwp8
	mV93Bs5KD4b4wTb/EVE/ARfzTfK/SF2Gn5hwKcBvyJ4i7Bpm32k90PlZrFSK/kzReADEa0YGk35
	M35YgHud8dqUCUIh8ytUnDYHfk0ngW31e8w3RGhOATHLbp+jyruS/IKNOUI3AtHwy6vsiK9PoHB
	ILS5CSyDmoKxXrS67wJ6S+KBt8kuHt7n89wozcfLZAGrrMZcyFx7WQVPBhFg3hYfHj/YsyuWFDR
	MpB95S1YaPiPony65rEfTFjeB+/Hq529o030n/I=
X-Received: by 2002:a05:6000:4024:b0:436:1b1:6cbb with SMTP id
 ffacd0b85a97d-4378aa01106mr5591885f8f.7.1770917953341; Thu, 12 Feb 2026
 09:39:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260208215839.87595-1-nphamcs@gmail.com> <CAKEwX=OvuVPJzQsSQm8F+zsRgJFnbMmW2JMJbGebp=U8+jMRYA@mail.gmail.com>
 <13e3cada-60a3-4451-ab7e-16dfbab3c352@kernel.org> <CAKEwX=Pww3ZNw=VGZBa46NhKuvefRM7wnVuZy0aADoCoE1KSzA@mail.gmail.com>
In-Reply-To: <CAKEwX=Pww3ZNw=VGZBa46NhKuvefRM7wnVuZy0aADoCoE1KSzA@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 12 Feb 2026 09:39:02 -0800
X-Gm-Features: AZwV_QinV0WPB7Xpdl--Xq3J6j8mlfT34orj9Pvsm2hWI8SWmVi_aDb838NayvE
Message-ID: <CAKEwX=Oqn5vZrYnURqwoNBhBmA5xU9jy5-5ti8vzFs2DHDaWYg@mail.gmail.com>
Subject: Re: [PATCH v3 00/20] Virtual Swap Space
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, hannes@cmpxchg.org, 
	hughd@google.com, yosry.ahmed@linux.dev, mhocko@kernel.org, 
	roman.gushchin@linux.dev, shakeel.butt@linux.dev, muchun.song@linux.dev, 
	len.brown@intel.com, chengming.zhou@linux.dev, kasong@tencent.com, 
	chrisl@kernel.org, huang.ying.caritas@gmail.com, ryan.roberts@arm.com, 
	shikemeng@huaweicloud.com, viro@zeniv.linux.org.uk, baohua@kernel.org, 
	bhe@redhat.com, osalvador@suse.de, lorenzo.stoakes@oracle.com, 
	christophe.leroy@csgroup.eu, pavel@kernel.org, kernel-team@meta.com, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-pm@vger.kernel.org, peterx@redhat.com, riel@surriel.com, 
	joshua.hahnjy@gmail.com, npache@redhat.com, gourry@gourry.net, 
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, 
	rafael@kernel.org, jannh@google.com, pfalcato@suse.de, 
	zhengqi.arch@bytedance.com, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, tglx@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, lenb@kernel.org, 
	Zi Yan <ziy@nvidia.com>, dev.jain@arm.com, lance.yang@linux.dev, 
	matthew.brost@intel.com, rakie.kim@sk.com, byungchul@sk.com, 
	"Huang, Ying" <ying.huang@linux.alibaba.com>, apopple@nvidia.com, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[get_maintainers.pl:server fail,mail.gmail.com:server fail,sin.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-75930-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kvack.org,linux-foundation.org,cmpxchg.org,google.com,linux.dev,kernel.org,intel.com,tencent.com,gmail.com,arm.com,huaweicloud.com,zeniv.linux.org.uk,redhat.com,suse.de,oracle.com,csgroup.eu,meta.com,vger.kernel.org,surriel.com,gourry.net,bytedance.com,suse.cz,suse.com,lwn.net,infradead.org,linux.alibaba.com,nvidia.com,sk.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_GT_50(0.00)[59];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nphamcs@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 990CE130011
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 9:29=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Thu, Feb 12, 2026 at 4:23=E2=80=AFAM David Hildenbrand (Arm)
> <david@kernel.org> wrote:
> >>
> > Are you CCing all maintainers that get_maintainers.pl suggests you to c=
c?
> >
> > --
> > Cheers,
> >
> > David
>
> I hope so... did I miss someone? If so, my apologies - I manually add
> them one at a time to be completely honest. The list is huge...
>
> I'll probably use a script to convert that huge output next time into "--=
cc".
>

Ok let's try... this :) Probably should have done it from the start,
but better late than never...

Not sure who was missing from the first run - my apologies if I did
that.... I'll be more careful with huge cc list next time and just
scriptify it.

