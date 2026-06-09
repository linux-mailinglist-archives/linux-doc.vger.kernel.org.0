Return-Path: <linux-doc+bounces-91546-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sBwcJIbNJ2oO2gIAu9opvQ
	(envelope-from <linux-doc+bounces-91546-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 10:23:34 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8E765DBA3
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 10:23:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LCm1Fh8M;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91546-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-91546-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B1BED30D3196
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 08:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0233E9C0E;
	Tue,  9 Jun 2026 08:11:46 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2958D3E9C2C
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 08:11:43 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992705; cv=pass; b=ZOMEP7aJlNcHUi23tmnXYtyuVWyKZ8trP6J1QTm8EMFyUypDtrjgtbfFz5ynjjZUAkqpvHtdipZip5WAEeGKauku3a0ceXn4I0a0TiQKSSBlWek/YcZ072WYyopeZGJZCETh/BhunebCKgutfAdEvZRYsNW8HI4165zOkgcHnwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992705; c=relaxed/simple;
	bh=+f25u6xmkKCLRHSUbmb93c62xTKsVOaMCDh/yapAjVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kfh3jJ6BVa2PO2/2A3hbNYf4KhEBLBtw+zHeN6i+ETTtiHgrlAfBhPDffwOMXiLIa89HPdAKHP9pIx6LZX47hXZ4H9zMpgnT9XXchfaJ0SaR55OZ0D8hwg8+107HLbo9s8bIrU6ySxjp7LDNbFdfR36TZeoGqvuLFRVjXsGLBwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCm1Fh8M; arc=pass smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490d1e54b3bso15243795e9.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 01:11:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780992702; cv=none;
        d=google.com; s=arc-20240605;
        b=Lvawu1V+pFjBSj5FUTojAVoEbrPNWncSCZZia3CEU49WAxNz11GII/7Fkc9QZqdAtj
         gdz5KOrLSwIdFROD8bX37nbAO5QBZaP/UToYQQSwA4lLL7vsQG8FqT8oLOe2buE/J7Z3
         cJYBdiqvrngVBMe2AIq5mfpr1RREH5vCAkx6tVA2QOJ9UQryB5Pc/+WbrAsQB43RYZJy
         ReB/7fx4+3qFp3ZG5PGHhEQyuy3wja2L2J+pG1/LW6ptxsfbSFckuvvCog8VMIetEiRl
         KNu1eUlYFpzfl8xjoWiMJfUr/TroVDzvmAc20ohwi52Xiqj/K8QBZ+mimuMAZJha5BH0
         e1Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8QsY1n5N4iqtdC4BlDMhKaWRGC0gk3S4nMtz5szdAAI=;
        fh=TgMVUhtfgxtNeQmsoAFrKkeR0KXAuywQj2/MhvO8kyc=;
        b=T7FxvszMIKWOXhWA7s/g70lF2djskVPoYqFTqXz81NlRNWawhf8Ct9cfoYU5dls2RR
         s4t58J9IvGhJK9vUt2i3pzOqV/MbAwr4u4JqGB2KkNDzUsoZhBM2CVmY0Jiad6VJFiEU
         PHmgdRhor6mDEC5lq65QOhaamDjLXUQrdGLnghGLIl6tawst5PSz/9W58zTJtWxQmAA3
         yKUeYABk6w2NGCD/qnG+qw/19mtgw00yXheZbNj9cHylVMcCwo8ww0sTHJ9O9SLiuLAT
         XN2pwqYKMOzQJHXzME7dWip1Uosd/5h8HT7swZ5QQQTogl5nic7Q5K6wylHTsPDbvB87
         I+vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780992702; x=1781597502; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8QsY1n5N4iqtdC4BlDMhKaWRGC0gk3S4nMtz5szdAAI=;
        b=LCm1Fh8MgRed+qCMUobVMtUlTOr5oYJuQ+NUQw1bvJE4Us0aDNavw7+TeSuV/RMjuH
         4cOd4icezi8Bfp+vafKdhmbz9dzxYZFIJ3ETTaCTShBE1I3VfdazGsA6sLFGszhFxUHn
         ggpd4StJApjn2T3y0KxinN0MRiw4mdNmfFauKCeaZzOprzaGAgybIKSuD17tixNDcXJx
         zJhVv0VVhJ/oBWdXU5mKOr/W4tYz+wSoH2BiP3thYYIyDZaQJMVjVQLQVWODDGbEkGzw
         pUA7dAe95XLnUaMaXuauGkYgeLGdu8tsGCirdLecwHgKm5CLorIdv5yUQTh+RFE+d+rR
         AuSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780992702; x=1781597502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8QsY1n5N4iqtdC4BlDMhKaWRGC0gk3S4nMtz5szdAAI=;
        b=HEdsIc8v3QGRD2W/owRzPwWvH0x8SfKxNFMlxyAmf+oNLrKemtCQkHlBTprKXUA8Mc
         Eqf+bAiFOJsLFS7AmZyyw63ZNjkz7d5DusafABXJyUarDbFF2fe0+XdfJU5uCB924r9M
         uUUt0PCH2Cw6XlN2mzxkIvrgJ57ACUoq7/KhOzHK3+5OV/kR7l4ilFFEP88DJQJOdkIQ
         afKxbdHq/C9QrEvCJFzf06mwwiH7OG8wOskP+Lr/jV+I7J1DNYVW4JssyrF3lPGXHEq+
         cx+KlboA8uDq3LXigl0trXoAUmt6iNYKk6nrresW/SdwNJBEu29iaaJPsh3FtQ+hV8du
         i3fw==
X-Forwarded-Encrypted: i=1; AFNElJ9oyn7Rq2kWvcZHy00ZIY+H4hjcvIDEKNUpMav9phGEjUITlc7rLaF5nKmWhv1gD/FdUhvpqusbjKI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5vaC2671gCF+6sijg1o3OqsThDrm5F267YSOSEG3ZKpXgOhiL
	eDfk73piPG83bewKdEK96B8akKlgOGWtUG3NO3D4P/SJjv15ZIrwbW8rrB1xkTLWWwL1HyMhg3+
	bPxlZ3rv9mUE5wVqiLd2JTDEbKmqs3ec=
X-Gm-Gg: Acq92OFRg/lbdV6iekE4vt9AV/DDAVmniFvPGNXzII0iNODv5WxjsHS+cRJpC9G71T+
	SwqF2QXOW6yHhBHs0U43Xq2nYVCgcmKor3DH7POr2IdKbsHoPo7CDi8qNdzaopsp0Q5mKEpxgvr
	G+SUzr+c46GMoYnypomUnpj06du6tDjCXn7UP5udJ/TIBu1BUs4soYBoMx94B2QnYQdId/uRLMM
	RQxeReYk6+1yVQD1qDVAVoXFAFHKewflBsQJJq/n25DUuQ7Iy5L9dJhNphXbiBdceRvQ424wc0y
	bNUsk9s7pTYZWKclulF9LgBnvr751w6RqCIMhJ5SNHxJMBLgTFmmux+tfJvI5m8=
X-Received: by 2002:a05:600c:34cb:b0:48e:6db3:ff3a with SMTP id
 5b1f17b1804b1-490c25b09a2mr318277935e9.16.1780992702020; Tue, 09 Jun 2026
 01:11:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605031008.397328-1-kunwu.chan@linux.dev> <20260606005431.89186-1-sj@kernel.org>
In-Reply-To: <20260606005431.89186-1-sj@kernel.org>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Tue, 9 Jun 2026 16:11:30 +0800
X-Gm-Features: AVVi8CdH0juoNThKREsErMsXdOM9cAvNHpugD-3PSlQpcq7Fci8WlqM2nwe8H74
Message-ID: <CAN_Opa8sqs-V-jFrGZa6jwJKdHqT=7JPeLKcU8E-cCM74ON4DA@mail.gmail.com>
Subject: Re: [PATCH] Docs/damon: add TLB flush policy document
To: SeongJae Park <sj@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	damon@lists.linux.dev, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wang Lian <lianux.mm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91546-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sj@kernel.org,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:damon@lists.linux.dev,m:linux-mm@kvack.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lianux.mm@gmail.com,m:lianuxmm@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[kunwuchan@gmail.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,infradead.org,google.com,suse.com,lwn.net,linuxfoundation.org,lists.linux.dev,kvack.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kunwuchan@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E8E765DBA3

On Sat, Jun 6, 2026 at 8:54=E2=80=AFAM SeongJae Park <sj@kernel.org> wrote:
>
> Hi Kunwu and Lian,
>
> On Fri,  5 Jun 2026 11:10:08 +0800 Kunwu Chan <kunwu.chan@gmail.com> wrot=
e:
>
> > From: Kunwu Chan <kunwu.chan@gmail.com>
> >
> > DAMON avoids TLB flushes after clearing PTE Accessed bits for sampling.
> > The overhead was measured and found significant [1].  Production
> > workloads with large working sets flush TLB buffers naturally, so
> > accuracy impact is negligible.
> >
> > On systems with large TLB buffers and small test workloads, stale TLB
> > entries persist across sampling intervals and produce false negatives.
> > This comes up repeatedly on the mailing list and in private inquiries
> > [2][3].
> >
> > Add a document on the design decision, trade-offs, test environment
> > problems, and recommendations.
> >
> > Link: https://lore.kernel.org/20200403103059.12762-1-sjpark@amazon.com =
[1]
> > Link: https://lore.kernel.org/20260117020731.226785-3-sj@kernel.org [2]
> > Link: https://lore.kernel.org/all/20260526145034.91594-1-sj@kernel.org =
[3]
>
> Thank you for this great patch!
>
> >
> > Co-developed-by: Wang Lian <lianux.mm@gmail.com>
> > Signed-off-by: Wang Lian <lianux.mm@gmail.com>
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > ---
> >  Documentation/mm/damon/index.rst     |   1 +
> >  Documentation/mm/damon/tlb_flush.rst | 131 +++++++++++++++++++++++++++
> >  2 files changed, 132 insertions(+)
> >  create mode 100644 Documentation/mm/damon/tlb_flush.rst
> >
> > diff --git a/Documentation/mm/damon/index.rst b/Documentation/mm/damon/=
index.rst
> > index 318f6a7bfea4..5e239437dab3 100644
> > --- a/Documentation/mm/damon/index.rst
> > +++ b/Documentation/mm/damon/index.rst
> > @@ -19,6 +19,7 @@ DAMON is a Linux kernel subsystem for efficient :ref:=
`data access monitoring
> >
> >     faq
> >     design
> > +   tlb_flush
> >     api
> >     maintainer-profile
> >
> > diff --git a/Documentation/mm/damon/tlb_flush.rst b/Documentation/mm/da=
mon/tlb_flush.rst
> > new file mode 100644
> [...]
>
> Great document!  That said, it feels like a good complete article or a pa=
per,
> rather than DAMON documentation that pursue to be short and essential.  I=
 feel
> like this fit more to be published in a blog like DAMON project blog [1],=
 or
> news site like LWN.  If you'd like to, please feel free to upload a PR or=
 send
> patch for DAMON project blog source [2].
>
> Mainly due to the verbosity, as I above mentionedd, I'm not sure if the c=
urrent
> shape of this patch is the best to be merged as is.  I also find the back=
ground
> part of the document is a kind of duplicate of some information in design=
.rst.
> What about putting only essential information in a condensed way on the
> design.rst?
>
Thanks, SJ. I agree =E2=80=94 this document reads more like an article than=
 short docs.

I'll follow your suggestion and submit it as a blog post to the DAMON
project blog instead.

Will send a PR to [2] soon. Thanks for the clear guidance.

> [1] https://damonitor.github.io/site_about
> [2] https://github.com/damonitor/damonitor.github.io/tree/master/blog_src
>
>
> Thanks,
> SJ
>
> [...]

