Return-Path: <linux-doc+bounces-94863-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UOXhC5nfR2pUgwAAu9opvQ
	(envelope-from <linux-doc+bounces-94863-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 18:13:13 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ADF7042D5
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 18:13:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=dilger-ca.20251104.gappssmtp.com header.s=20251104 header.b=S+Oes1Aj;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94863-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-94863-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 500E4300B293
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 16:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630BC302CD5;
	Fri,  3 Jul 2026 16:12:50 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F162F3C3D
	for <linux-doc@vger.kernel.org>; Fri,  3 Jul 2026 16:12:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783095169; cv=none; b=dvtj2pk11q5CNcyCYfldQm5DD+z9QmUpHqL2n94D+b5i7To7J+KI1+SVGxYZJ5Uv4OE+qmIQgX9uSz7HruqGWBFlfSkVq2alJmRfAmSgV6kB4/Fb1Q0OezdHFUT+qzVSXBYawcco/fPZZW+EUNxVa1KS39Cj7eGpBuzijjJTnYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783095169; c=relaxed/simple;
	bh=DDlppR72ZofS0gwf7T++swSGldaFduoIiD3WPtJRbEY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=n134BcoHj4TmAcWAvT3+QyJur8B5ikkHxyhqGF8lDbjyVrRXfYfnIelkD/SGJ3bh1l0g41mjBOlN6Lzfn8Ug0VhgSApVM2meZog4QHU5s/Zi+WeoHkYbLbM3Pirnf3o8YKxD8kkh/wmqPQEO4rpPl3zuwpH6ri0bXs6+X7TwDV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dilger.ca; spf=pass smtp.mailfrom=dilger.ca; dkim=pass (2048-bit key) header.d=dilger-ca.20251104.gappssmtp.com header.i=@dilger-ca.20251104.gappssmtp.com header.b=S+Oes1Aj; arc=none smtp.client-ip=209.85.216.47
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-37ff8e0ad0fso695363a91.2
        for <linux-doc@vger.kernel.org>; Fri, 03 Jul 2026 09:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dilger-ca.20251104.gappssmtp.com; s=20251104; t=1783095167; x=1783699967; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuYdqZO6P8sYYUQnX9Vmulsb3aoIphpVLP6QakGqXqA=;
        b=S+Oes1Ajap0efry0Bu0qQXu9w1jj2g7qfPWJBpzSsuKaT/q/2ke5vxfs9dt9wfLFS8
         CPt/5W4b4k7wU8qqpDRwQkTZH1EAS1ZROM1f69lKWKazWdOwajOixfQq+lWL4Cmf53Ko
         qZ9fRuG2tsDXbKtDXyRvjZK6mx7fyc/xLVfexT9c+TS1Cn+Pqc6fenniyzFiHzHz7rTK
         TaRvgEGKOhVDEVDD+Rl9In7gVcfFYRaFeeyUydLXmmxLnWR+/eFPyOVqtlFx6um/mpaE
         c7zbDfepqqOXVijMJBXhsBVKaoYJaa5uCXi7yBNNFwMWw/Z1JUgez52KxtkZ6LYzWE6C
         moLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783095167; x=1783699967;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LuYdqZO6P8sYYUQnX9Vmulsb3aoIphpVLP6QakGqXqA=;
        b=IxjO4RoAUfAZJwfns58R2Z8Z0mZ+9PSsTqLX+086OfTa0+u8Wx3kfxYDbc89rCrNj/
         7Z2yo1UwTg1Sod8vIk7DOf3o88RwBUJoZgD8JvDybOZ/c1eT7KRTNQQss1ji1P0CzDs2
         6+DQQrqDaxcx8AQoYxOqoVDDG3m5lF4r6mO3fW8GBqoN91uMhF1ptcqWgv7I8h4UuQLw
         ywGzAr/+bAOeLxaNAfKrQ/Ln9dma/Q0hd+s6slJnmquR+MeTOCe9i/WrC/mWDCPd5meO
         A1caPi29j7DpJ2K5F9JCMeGry3nP/6y6AOI9igGgAurVK2SFSBNzwHhrCOiGVO0PL2zU
         FZ0A==
X-Forwarded-Encrypted: i=1; AHgh+Rr7n8yLL5Slui4+d9/MJFRozRACE5QePgNOlBcQPkcEv3xi2hb2bHTty1P4ng84Ud3X7rmoTuXc7SU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnEUKLhgZpDYaMzXJJucE8d9ELvE56g63AW149R1D1ALuHIIBn
	c/E6/VFpEsWoa/29pGpqaLo+tDloHEw9bn5gkMrgNevu7z9JRfPStp/IQV/r+1fdvZVMo7uRAAF
	3CnD1GssFEw==
X-Gm-Gg: AfdE7cnbsUuj57bFz4zSc7zti3XTJ7X0i2dyeI0MsYhZ5eMOYkMfDwoA1GZ+6s0a9ZF
	vMbfBBLl5WXo83G51VaesP9F2/JwrHlM09TXqM0MM048QtyRgiiWNZd/ZO/MkKm4tAUsbLAgrgv
	RabAgLJWqNhYxTMYLGdE3RjWML6Fkr5t+SaR1p82HJ6TWzuKfUId4RuhDqs0QXdcmB52FYs9++P
	yOH9yaBLVtThtgnvp7n8HNvqsxWkAiCyXMfhuGZ9oc6vtEAPQpyC4/DE78Sh9jAkcvktWcU/dI0
	IxgLb4zBp3NT3ZGZIBjWTthZkCl9A+OyG50cB6pUxY5buCpTAYD37KANrPMpf2ir/P/LUBgM/dM
	arlKfArTFvpbi+A0YRWDgFz7UXoI2m45Gu3FHwXqWo/feQqtPOWh/rFJ8awBaQ3CwvahpeBN1bR
	PDh9tk44MrayJBPMaZ1oSqcPvtwBNQdieLbZfr8v7qjkRXLLSE5v69dy9r8419G0i8rw==
X-Received: by 2002:a17:90b:50:b0:37f:9ce2:348d with SMTP id 98e67ed59e1d1-3829fddab93mr148112a91.30.1783095166730;
        Fri, 03 Jul 2026 09:12:46 -0700 (PDT)
Received: from smtpclient.apple (S0106a0ff70715ac6.ek.shawcable.net. [174.0.84.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38097d81bd9sm3194250a91.1.2026.07.03.09.12.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Jul 2026 09:12:46 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.100.1.1.5\))
Subject: Re: [PATCH] Documentation: remove the requirement for LLM attribution
From: Andreas Dilger <adilger@dilger.ca>
In-Reply-To: <akcji3OuxXz3FqSD@mit.edu>
Date: Fri, 3 Jul 2026 10:12:34 -0600
Cc: Jonathan Corbet <corbet@lwn.net>,
 Greg KH <gregkh@linuxfoundation.org>,
 Jeff Layton <jlayton@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Justin Stitt <justinstitt@google.com>,
 Lorenzo Stoakes <ljs@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Carlos Maiolino <cem@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Jori Koolstra <jkoolstra@xs4all.nl>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Brian Foster <bfoster@redhat.com>,
 Christoph Hellwig <hch@infradead.org>,
 David Disseldorp <ddiss@suse.de>,
 Mark Brown <broonie@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Jens Axboe <axboe@kernel.dk>,
 David Hildenbrand <david@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 "Christian Brauner (Amutable)" <brauner@kernel.org>,
 workflows@vger.kernel.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <19942440-EB87-4D3E-B37F-3146500BED8C@dilger.ca>
References: <20260702-aidoc-v1-1-735572dfb995@kernel.org>
 <2026070224-unholy-commode-cf45@gregkh> <87cxx5l900.fsf@trenco.lwn.net>
 <7C39A5C8-EA03-4C8D-9BE5-5097101B71D6@dilger.ca> <akcji3OuxXz3FqSD@mit.edu>
To: Theodore Tso <tytso@mit.edu>
X-Mailer: Apple Mail (2.3864.100.1.1.5)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[dilger-ca.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:gregkh@linuxfoundation.org,m:jlayton@kernel.org,m:torvalds@linux-foundation.org,m:justinstitt@google.com,m:ljs@kernel.org,m:laurent.pinchart@ideasonboard.com,m:cem@kernel.org,m:kuba@kernel.org,m:jkoolstra@xs4all.nl,m:krzk@kernel.org,m:bfoster@redhat.com,m:hch@infradead.org,m:ddiss@suse.de,m:broonie@kernel.org,m:jani.nikula@intel.com,m:axboe@kernel.dk,m:david@kernel.org,m:vbabka@kernel.org,m:brauner@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:tytso@mit.edu,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-94863-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[dilger.ca];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,kernel.org,linux-foundation.org,google.com,ideasonboard.com,xs4all.nl,redhat.com,infradead.org,suse.de,intel.com,kernel.dk,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[adilger@dilger.ca,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[dilger-ca.20251104.gappssmtp.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adilger@dilger.ca,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dilger-ca.20251104.gappssmtp.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 20ADF7042D5

On Jul 2, 2026, at 20:57, Theodore Tso <tytso@mit.edu> wrote:
>=20
> On Thu, Jul 02, 2026 at 12:46:19PM -0500, Andreas Dilger wrote:
>> It would make sense IMHO to address the ignorance in the most =
expedient manner,
>> namely by telling the *LLM itself* to add this tag when it generates =
the commit
>> message and/or reviews the code.
>>=20
>> This could be achieved by adding a statement in "AGENTS.md" in the =
root of the
>> source tree to this effect, or telling the agent to reference and =
follow rules
>> in Documentation/process/coding-assistants.rst regarding the =
Assisted-by: tag.
>=20
> This presupposes a particular workflow where the developer allows the
> LLM to generate git commits.  I don't do that.  I'll ask the LLM to
> modify the code, but then I'll generally fix it up --- very often by
> hand because I can edit the sources than entering a prompt and waiting
> for the LLM to figure out how to make the change.  I'll often run the
> test cases myself, since if it takes 24 hours of VM time, and 2 hours
> of wall clock time, I'm going to kick off the regression tests myself,
> and verify the test results.

Sure, and that holds true for many kernel developers, myself included.
I don't think you or any of the senior maintainers are the audience.

The point of my comment is that this is more likely to help contributors
who do *not* know/follow standard development practices and are more
likely to contribute AI-coded patches, which is AFAICS the main issue
in this discussion.

Also, the effort of doing so is very minimal and has no real downside.
Having the AI contribution policy clearly spelled out where an AI agent
can find it can only have a positive effect, even if not always =
followed.

Cheers, Andreas

> And I almost always write the commit description myself.  So when I
> say, "Assisted-by" it literally is "Assisted by".  It is not "vibe
> coded where the LLM generates thousands of lines of code that the
> human being doesn't understand before sending ta pull request."  And
> that's probably why you'll see people asserting that LLM generated
> code can't possibly be accepted due to copyright reasons.  There's a
> big difference between asking an LLM to modify already existing code
> to add a feature, or to fix a bug, and to vibe code a new OS from
> scratch.  One is far less likely to be a copyright violation than the
> other.
>=20
> - Ted


Cheers, Andreas






