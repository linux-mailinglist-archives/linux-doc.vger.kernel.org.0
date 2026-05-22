Return-Path: <linux-doc+bounces-88849-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIPxCx63D2qCPAYAu9opvQ
	(envelope-from <linux-doc+bounces-88849-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 22 May 2026 03:53:34 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E415ADC19
	for <lists+linux-doc@lfdr.de>; Fri, 22 May 2026 03:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1ECC0300D6AC
	for <lists+linux-doc@lfdr.de>; Fri, 22 May 2026 01:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671142BE7DD;
	Fri, 22 May 2026 01:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RlDcV8Xb"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2401E5B9A;
	Fri, 22 May 2026 01:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779414811; cv=none; b=QnMJGCuc/b2345s96jPZLDBPNsO2m23WBG+4ZplS80Fhb6+qDgfStR1a0D8rkkA8RfWLgboq2W2rnaep9W7X1Fa9Req9gy0fKhJUJb3EEhYnrqcTDCaB1XVX2mVT9N9FRAlb2QynwLTSYMVlGvccZqm5QmWX+5oMaCIqd5gwkUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779414811; c=relaxed/simple;
	bh=f9lf6UJ47DfyicLEjelCmyVgtwCrW/4RoY/QChlTUxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ensd08HdYtMM2OXER5ShcBLNq7K0eC2qL7GujDmzzMh0sy5LDZsTaYTHKUQsgllqks6VnY9HlOde8RARpdbT0B+zX9It3WjR437oJkZYukY6XGSCt3fWXuMVgkJ3nvjEZJ6r/mBfY3Js9srDATOTCk7cBA9/lDo0SPxrGMvltOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RlDcV8Xb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459B21F000E9;
	Fri, 22 May 2026 01:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779414810;
	bh=OTPFl6TPAkk+ECSMpS4uYTfEhV6l49Ocas0GPmgCNN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RlDcV8Xb2WVEDHQxZX90yxf5k5vjYi+ACkSmyc4kZvYjhZ4aFQakenflseXWyUpAD
	 Jm2oXFzLPDkxqV8nFylSypHGP9ses+JRh3WqlFOIV/bII7sTjufPQC4SujEmK7rRmr
	 WJdWhQryLX2NyfZVyC/33XAAyLpGUOItb+NKojKaalJHd9EpUNrBrGjTvv6netwWjp
	 DVByyJkAXh7hh9CVj1bXxDKhPv9TjBB4zoAdx116sqLv+Vr2DlT9m8VaDgWJCL5xoZ
	 ahnhqezOmGq5ddr9SqGrsolTEsFW8yYTepCYYge0OeIkFNZNxpXMqLIYIEi/W30q4o
	 BZx+16Ht8rxcQ==
From: SeongJae Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH RESEND 0/3] mm/damon: reposting three reviewed patches
Date: Thu, 21 May 2026 18:53:21 -0700
Message-ID: <20260522015321.86261-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260521175753.3c6369dd3fdb52ea3816ff2b@linux-foundation.org>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-88849-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 69E415ADC19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026 17:57:53 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> On Tue, 19 May 2026 18:20:58 -0700 SeongJae Park <sj@kernel.org> wrote:
> 
> > Subject: [PATCH RESEND 0/3] mm/damon: reposting three reviewed patches
> > 
> > ...
> >
> > This series reposts patches that were reviewed by the DAMON maintainer
> > but not yet added to mm-new, for more visibility.  From their last
> > posted versions, only minor changes including commit subject update,
> > Reviewed-by: and Acked-by: tags collection, and rebasing to latest
> > mm-new were made by the DAMON maintainer.
> 
> fwiw, I don't think the Subject or the text are appropriate/useful for
> the long-term upstream kernel record.  It's all short-term
> development-time info which is best kept below the "---" separator and
> discarded for the permanent record.

I agree.  I was also wondering what subject and commit message should be given
here, because the original authors didn't meant to send these as one series.
So I was assuming you may simply drop the cover letter and made this ridiculous
one.

> 
> I rewrote the Subject: to "mm/damon: documentation and comment fixes"
> and left the [0/N] cover-leter empty.

This makes sense and seems better to me.  I will do similar in future.


Thanks,
SJ

