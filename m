Return-Path: <linux-doc+bounces-23243-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 763319574A6
	for <lists+linux-doc@lfdr.de>; Mon, 19 Aug 2024 21:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED6DA1F2198C
	for <lists+linux-doc@lfdr.de>; Mon, 19 Aug 2024 19:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F23F1DC497;
	Mon, 19 Aug 2024 19:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Ml+q0awz"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDA81DC47C
	for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 19:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724096473; cv=none; b=qfagY6QhfqZlSrDS4PjJ87n6sRoEE+ekRmN1EOb67Nk0zi0R3mxFtohre3j8Jb4kskJUMyk/0arkiAL4wJi5SAE34GxsqjoOnlQaC1aN0Mt3m5qmI+nMHzyhb5XYPA6Tt2ZtiNSN5Mll+Fna+fqEgJiHOWZZtM/TZgZdixjp+WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724096473; c=relaxed/simple;
	bh=hcSbya+lQiysjoDdhMa2fNXAwE9cTf3HMVXCOHk8tdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g6F0Jg5ylCng4Y9RIkSjRQJYDAAnYu9Zm/cZWYTXlBii4KqoOQF/NXyn61dIqNfgrrRH1imHyQ6OwMiwSwEP9g0/FLV636Sxb6yEz74if0thyPAy4FVCIG1qQ8XJ8YqaZj4zwsRuGeCV78MjhZS9Jv6PbgWKb3EPOzQ/TQnhsjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Ml+q0awz; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-690aabe2600so39419127b3.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 12:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1724096469; x=1724701269; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkyhANmIfoPUx8Ztj0L2oahwdkEC/9ySCXObPcfO7yE=;
        b=Ml+q0awz6T48Y28kUNsbAqMvhhLu1OT+Fw0Q2W4JkWxl6hDRrIwmMXiTtCI3BM0wIB
         1BVfrpdC+pdrXFrjxZwmwJFVXe2FvKLOAkCUsevU5fsIR8YHyKsuzbmjkOEMS8MP4+Lk
         8T3xNnHOfBccmUSlGwU7APIbe5Et5SRGxoFtbt3NNXi+lr16eHzU7wz5ZUvkkjBrRb+F
         AhpD6as2bkTGucQwCHteWPpgiSO2gB1pUHhKdN9s8rVBS7IuVWySrYAIfT8IqRLWhjZI
         jcB/TLJSRxgOP1IrerDKgY/ZwjTf/tzaD3GmGNNqb1jVXyaZ0IVvTy/M1SIslKmTSQFg
         RqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724096469; x=1724701269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkyhANmIfoPUx8Ztj0L2oahwdkEC/9ySCXObPcfO7yE=;
        b=A90Jc2NSTVBOsu1lZgCWUCWx/r2Sny/9QnVsZH+oD6SKngJ/hyQhkC0ZTx4PhgRgF7
         peMaCRKJCaEsYRhhIXiE9AmRlKVqOc0HA07HUuERoYcMZ5jQTbrnmMg0nPEmNofPA+lU
         oGC+mBANW3a3pxR41EWXxJ9sBAKgCGp2W2a/DgfDN9f1xnoNGjIRntNtSQmiSTOxnw7X
         PdvTfP6CWeNW98dEWkJ6Mzo2AVfAQouFFxgdFeDXntyFaOVSPq+H/zop8syFqoioWXGC
         AlGmYeysNPgfe5xE7oHD8DaCXOzICQvJygla2XgV7orMPbqZPR7ckIqy94SMOspJKyQ+
         8YTA==
X-Forwarded-Encrypted: i=1; AJvYcCXqKbejTyigr+wQqcTTUCfPIWLIIrkywMpa8i2qe5RO53BICAtnryOxNopCjsg//3bptY9Rryz65mY=@vger.kernel.org
X-Gm-Message-State: AOJu0YypoQrCgXHSQ8pf0cCSPTw+YgGMZ25opNQb01r5vBIQgjxdQHFU
	QghWdNgO/MkDkOzb8BfcbceFQb9om3+mUh183bFsA2S8jkilxPWeXkA8Ghx+SBAR14XbnlAtO6b
	eBIrYEoFrcLUll3en0ENhVncL/7cgGncofkM8TgCs+3DzGFk=
X-Google-Smtp-Source: AGHT+IGNxAzznyZ+b7siXNq+DgYF6mU9BKHCBgzIgMxr5gD2jPGN9khm6ib1o830lq2PyGnu1xXnHmPm9H/tqvZOtYQ=
X-Received: by 2002:a05:690c:f8a:b0:64b:69f0:f8f2 with SMTP id
 00721157ae682-6b1b9b5ad78mr147420827b3.3.1724096469531; Mon, 19 Aug 2024
 12:41:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1722665314-21156-1-git-send-email-wufan@linux.microsoft.com>
 <1722665314-21156-13-git-send-email-wufan@linux.microsoft.com>
 <9dc30ca6-486c-4fa9-910d-ed1dc6da0e95@linux.microsoft.com>
 <CAHC9VhQrnu8Sj=XnDvg=wGTBxacvMSW6OJyG3-tpwrsbGat6vA@mail.gmail.com>
 <88695db-efc0-6cc6-13ee-fd7c2abe61c@redhat.com> <ac6e33b8-ec1f-494a-874f-9a16d3316fce@linux.microsoft.com>
 <CAHC9VhSe0HkzX0gy5Oo+549wG9xqfeHmsveJqdR_xRcYtim+sA@mail.gmail.com> <8421b247-41d2-4bf5-ba80-f356a2b696fd@linux.microsoft.com>
In-Reply-To: <8421b247-41d2-4bf5-ba80-f356a2b696fd@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 19 Aug 2024 15:40:58 -0400
Message-ID: <CAHC9VhR1gkiB=etUwgqnkZuBiSy1VD4ZgyUeTWvLQTowgQchFg@mail.gmail.com>
Subject: Re: [PATCH v20 12/20] dm verity: expose root hash digest and
 signature data to LSMs
To: Fan Wu <wufan@linux.microsoft.com>
Cc: Mikulas Patocka <mpatocka@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Alasdair Kergon <agk@redhat.com>, linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-security-module@vger.kernel.org, fsverity@lists.linux.dev, 
	linux-block@vger.kernel.org, dm-devel@lists.linux.dev, audit@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 1:47=E2=80=AFPM Fan Wu <wufan@linux.microsoft.com> =
wrote:
> On 8/18/2024 10:22 AM, Paul Moore wrote:
> > On Fri, Aug 16, 2024 at 3:11=E2=80=AFPM Fan Wu <wufan@linux.microsoft.c=
om> wrote:
> >> On 8/16/2024 6:35 AM, Mikulas Patocka wrote:
> >
> > ...
> >
> >>>>>>
> >>>>>> +#ifdef CONFIG_SECURITY
> >>>>>> +     u8 *root_digest_sig;    /* signature of the root digest */
> >>>>>> +#endif /* CONFIG_SECURITY */
> >>>>>>         unsigned int salt_size;
> >>>>>>         sector_t data_start;    /* data offset in 512-byte sectors=
 */
> >>>>>>         sector_t hash_start;    /* hash start in blocks */
> >>>>>> @@ -58,6 +61,9 @@ struct dm_verity {
> >>>>>>         bool hash_failed:1;     /* set if hash of any block failed=
 */
> >>>>>>         bool use_bh_wq:1;       /* try to verify in BH wq before n=
ormal work-queue */
> >>>>>>         unsigned int digest_size;       /* digest size for the cur=
rent hash algorithm */
> >>>>>> +#ifdef CONFIG_SECURITY
> >>>>>> +     unsigned int sig_size;  /* root digest signature size */
> >>>>>> +#endif /* CONFIG_SECURITY */
> >>>>>>         unsigned int hash_reqsize; /* the size of temporary space =
for crypto */
> >>>>>>         enum verity_mode mode;  /* mode for handling verification =
errors */
> >>>>>>         unsigned int corrupted_errs;/* Number of errors for corrup=
ted blocks */
> >>>
> >>> Just nit-picking: I would move "unsigned int sig_size" up, after "u8
> >>> *root_digest_sig" entry.
> >>>
> >>> Mikulas
> >>
> >> Sure, I can make these two fields together.
> >
> > Fan, do you want me to move the @sig_size field when merging or are
> > you planning to submit another revision?  I'm happy to do it during
> > the merge, but I don't want to bother if you are going to post another
> > patchset.
>
> Thanks, Paul. It seems moving the field during the merge can expedite
> the process. Please go ahead with that. I appreciate your help with this!

No problem.  I'm going to merge these this afternoon, I'll send
another note when they are in the repo.

--=20
paul-moore.com

