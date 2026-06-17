Return-Path: <linux-doc+bounces-92641-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7TvBDjmpMmqE3QUAu9opvQ
	(envelope-from <linux-doc+bounces-92641-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 16:03:37 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3BD69A636
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 16:03:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WJJ7KIDw;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92641-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-92641-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D16393076307
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 14:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87707407CEF;
	Wed, 17 Jun 2026 14:01:35 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5644F407CD0
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 14:01:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781704895; cv=pass; b=ThxDfEo6wBfjlPl3Pzb8sCliyckI5LzZbqTfjOlJH7f+bt5zQwAEqaom1ii9+5u717GOAuG6DOHQjbgnB0we6jz7dfDYb4q54TnRccF/rsd5q5PcQ+BjLVzVhKDeFcCqwfhWEC+tsW1WW8ZXBdmpKqLZsXkLY7HnY2eatfl44Rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781704895; c=relaxed/simple;
	bh=d+DJYMfAXmvlnPojeQcYjc2FpmtRtc93BPdBcj/yJ2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U25/oZCiuna8PR1779Gtv0Zzicr114t+/WhysuqSA6smUBtdYsQYAp0S2HOgK8whxNZsmSYnNhnO73DuKTs0eVKtlGKQ/tkOtT34ZuNcb/I/Iypg4be73o42lQTtNpEBdvQsNeoDbWLClsUvczEE4UzjJnpN16E+Q626fIhbBlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJJ7KIDw; arc=pass smtp.client-ip=209.85.216.44
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36d8b644473so4993435a91.3
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 07:01:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781704894; cv=none;
        d=google.com; s=arc-20240605;
        b=hDrWVzBlH/nuyG6bAd4g3D0DWX7M8lwrmrREZBOOJ1SwostJs8nK+sQKNc+bq4H5pe
         wVuq67/pihGIlfOwxqtbGFPmqRg96+cnEtTO6Ms5QvsciBxWArCEOROgWaBD+UMyj+1K
         tSTXbgikaOjVN5mM7PNGDTkIOqo0iiDZl83SexwFHQcZbopMsfkhZnlDhtrGvwI4cQF8
         1GF5uhe16uGhCd1023PXbfkXKO2San1X1vRrP428COTXyKSvd5nkMo33meV4XByHgrO+
         eum3S9AiBPyIE3Ek12zX5OQclhw0q/Vv/cMetGoH8L9fqVDL6KthzYuoxNg9qE+pUMNS
         a7bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tiRv+G39h+X8YKopQA1rD5KpEf5r1LXb2YHn926YfMc=;
        fh=s9FkV0PLuBCYeZ5okjVdb73jDkZxLoN4m0AYxVWh0EY=;
        b=FHuti6NnZ+qwz6gzYoLlXAIIiHusx2pdUxKwKu0wqi1ITagVbVGUB9quNJ+P4rryJO
         roNbxGHlMQm/qIea1uqdxvlaluRP368rf5r+i69zzd1v3VyNirt6cN+9/fRHcGmY1u1U
         xUKTyEclnMynuEtZzSzdMvSI3Q5Rd1PQA1U0YFi+0KqOTXM/yYgnAQ4meURU/6HTU6ju
         neyIGh8PSkr5nvJcJ5owFtQkN1lwAQsyapqLr7C9eWBwWBgybBZTH022ywOTJtUq4iqz
         sIvhQGR9rEIO94VkJIF/gIYOMMrSAMOVt5oHYYnMs/Nj2hctrSGGB5i0OTQ+lxHe0lNL
         Gxvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781704894; x=1782309694; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tiRv+G39h+X8YKopQA1rD5KpEf5r1LXb2YHn926YfMc=;
        b=WJJ7KIDw1dDQ0IFIaYfeceXa/3cRIOQR3mRU1e7nsrzWNXgAMDRUX3sMK7s9Yyi5ck
         faPDfgSDe4AyDQ2jyAdf6rOfJd8nywiH0h1DprjC58gEirhbZsL4DK4utX7XU6xx+NNU
         UdoRGeTz052ebPyT8triSFNpYVCVKIvgQW+4MMA88l6MQqXqfvUjXR7x1pMfrjzGyVzj
         LUHOlWg6WVFQRQQOTM/CThqtvrol55/lDWO8uojB1d+poktbgiH8iTFTLYEAtN13ZHNS
         O0sWn8gURpJQj/HcYW9DptxkxqBvZcVdmRgwy264A1wPbty31SC60BGz4X5z6dNZe8IB
         3RCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781704894; x=1782309694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tiRv+G39h+X8YKopQA1rD5KpEf5r1LXb2YHn926YfMc=;
        b=cuPB56c1ADZ0L1U+Wqd1Ts8srwwU2piWBgIcQgTI+BPlBDAkV2l+1gpRyTvuWY4h81
         C7vJVY66gmPPulJzht8GGzdUWcjaZmdtIN2icyTt+QbtLtMRt6FusFbOX0+0qA0P7f7X
         gKHfhoycF85b0g1OnUXM/fpWem0wUoJp+ySUGmxY8/VwtZZ4equqGpOzF7geL3hz0MZE
         tDAJQlMm0kYtcBe69K65HA/CuifV2lG3j5S0VNk/jqSw95XJRvJKA71ocBs7zhtLsYSW
         ymCRD195f12vmA/fscUWEPYbvp7odLr3xbP4IOIum21Ta80Wo1ZJxKt/d9BULR5FI/Jz
         zm7w==
X-Forwarded-Encrypted: i=1; AFNElJ8X9CN/xWmWDzmYMohtHrNj7kR/wvlsIvrRGxY5BEy9tdgGXIjVOpnCzDwIWd3XDSn6ryv2Mj7kKro=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx3ZTYg59IHj/MqPczDWbMYmlwESNipQe3ItgOgacHf2F76ZkC
	JxsycC09RTYM/byGqm/IvGVar53FWfBcFBGPJ2yg6iJSlBf7/cTWlUcV/Zh8KFQCsMfoIkeUcYy
	vEMdpgLtFphjPbz3d6rn6r+HWktjR4F8=
X-Gm-Gg: AfdE7cnpALwedPCChs8JPsLjRHd8kLlhqJgvujuOLsHgfk+ZKP4yJgg1TkvaFUKcIWY
	+0yUC8VDOCaslDjvQDjVz96haKwG4JWCnOdJi+ooAqZSE7oYWw3FDOuMv95n/G2TI0ELfQDNzNt
	R0LObUZ/Ect4APDLscqDl481GdK322hYy1INLXz51aSvlHo2ot/yNu4Wz+gdrPTdyOT9nFVN3JF
	bCljuWszakPoGtPBNzDR4xFkK7UnN8lCVhyPI52iQXlX9gZKARfrVoESIaw9r9GlcfR5BKFtrDy
	faCPHwGsHeYnRKgaixrjrIjY3g==
X-Received: by 2002:a17:90b:350c:b0:377:36af:c996 with SMTP id
 98e67ed59e1d1-37c947363e6mr4256111a91.21.1781704892396; Wed, 17 Jun 2026
 07:01:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614-zram-swap-ops-block-register-v1-0-6c1a6639c222@gmail.com>
 <20260616123646.GB21024@lst.de> <CAJxJ_jhK+zkpjhs3YsQ9RoasKYh+E0NweQci0sPAEY1ne5LmBA@mail.gmail.com>
 <20260617061743.GA19844@lst.de>
In-Reply-To: <20260617061743.GA19844@lst.de>
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Wed, 17 Jun 2026 22:01:19 +0800
X-Gm-Features: AVVi8CcmbYlKs19G5r-C0VfRk8c0vOg--A7ctAfStsGLM_YhFG6Fmldj3URh3So
Message-ID: <CAJxJ_jiBFUwqZwbE1XQg4oKM0XDrBzZeScvJ0PAUqusG0CObvw@mail.gmail.com>
Subject: Re: [PATCH 0/3] mm/zram: route block swap I/O through swap_ops
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <bhe@redhat.com>, Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Youngjun Park <youngjun.park@lge.com>, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Jens Axboe <axboe@kernel.dk>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:bhe@redhat.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:youngjun.park@lge.com,m:minchan@kernel.org,m:senozhatsky@chromium.org,m:axboe@kernel.dk,m:willy@infradead.org,m:jack@suse.cz,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-92641-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[wujianyue000@gmail.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,redhat.com,gmail.com,tencent.com,huaweicloud.com,lge.com,chromium.org,kernel.dk,infradead.org,suse.cz,kvack.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wujianyue000@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,lst.de:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F3BD69A636

On Wed, Jun 17, 2026 at 2:17=E2=80=AFPM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> On Wed, Jun 17, 2026 at 11:38:02AM +0800, Jianyue Wu wrote:
> > Before I rework or drop the RFC, could you outline how you see that
> > core-side model working? In particular:
> >   - How should a compressed backend like zram or future block device
> >     plug into swap_iocb / swap_ops?
>
> I don't think that is the right layer.  The virtual swap layer that is
> currently in the process of being upstreamed is the right level, and
> the actual swap devices or swap files are just a dumb backend for what
> they higher level code does.
>
> >   - What role do you expect zram to keep while the legacy block interfa=
ce
> >     remains: current block swap only, or something else?
>
> For now we'll need to keep it working as-is.  It is heavily used in
> android and potentially elsewhere.  Once we have zswap fully working
> in the virtual swap layer world it might make sense to say never
> compress again in zram when REQ_SWAP is set (or maybe a new
> REQ_COPRESSED) so that we can use the core compression code without
> breaking existing setups.
>
Hello Christoph,

Thanks for the clarification.

I understand the goal is to have more common code in the core layer,
with dumb backends. On the swap path, once core has already compressed
the data, zram would only store it and not compress again, while
non-swap use of zram stays as-is.

Thanks,
Jianyue

