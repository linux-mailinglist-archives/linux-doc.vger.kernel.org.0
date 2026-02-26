Return-Path: <linux-doc+bounces-77122-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIMCAeqan2mucwQAu9opvQ
	(envelope-from <linux-doc+bounces-77122-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 26 Feb 2026 01:59:22 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B0D19FABB
	for <lists+linux-doc@lfdr.de>; Thu, 26 Feb 2026 01:59:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3C6C30382B3
	for <lists+linux-doc@lfdr.de>; Thu, 26 Feb 2026 00:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E3636EAB7;
	Thu, 26 Feb 2026 00:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aMNubDGH"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99CD36D4E6;
	Thu, 26 Feb 2026 00:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772067559; cv=none; b=uRdlK8Znqvtc+a1aOpY+LuOGcT7xGpdMQ6c8qhkonMlMxXh1uvNpxKVZNylhLPQIC7rPzq5g23ySyWEJU1vQGHxmz6dBC+nQz2f7WNx0Ll1l+SfOk2pVutaMJshmOs2YVrke4G954g7VpfPx+EdOV0bFGEHg34mQ7VO6WQSrDNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772067559; c=relaxed/simple;
	bh=WgtMgVEJKBbw5rku/Ulb3PMFelZylX2qCcQghD/WKGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dT0zbQvNYH/0akW9OSNYYuSlKttxcr5kDwvwLbcWGX7373An3pMovghYs5KcBc4S/34HMy2B8Z/I27iz35FDsMA2+XgzVIWrtocJuHSnJ2rWmOXoeQWFW6Tp/fqDrnjBjWEEJby6Xh5dhfns1D46YiMMeL5X6Fh+Z+DI/27G0cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aMNubDGH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0BBC116D0;
	Thu, 26 Feb 2026 00:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772067558;
	bh=WgtMgVEJKBbw5rku/Ulb3PMFelZylX2qCcQghD/WKGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aMNubDGHFO4gX9UZIZ0xL+udtZ8ylyA4aHsLnZPtS0UrNwyrlD1SemckyK6PmBSHi
	 vLI+hW533UdcQOdT2JUqkht2gmkGCP/Kvra+ZCn71s/jjGRKIGIKcfrnq8wnT1dcPf
	 E28L5kPqiXXB7spXLQNP/fQcufvcN8Ha+p33TAwetW+L5OcRjTpOlb2txC58tLrdJU
	 L5EADGe/7D6JStAQWd2u0fvJAgbcNgttvev5/8eKgKG7MoQoRbaY/QwYKZ3grCI3am
	 1QCpgTzsMRet9RN7sOldX3esvjswLpW+84aVTIDJDwynyJxvFt7U4lOmCwAukvd/I2
	 43I4Ix7qqd8vQ==
From: SeongJae Park <sj@kernel.org>
To: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com
Subject: Re: [RFC PATCH v4 4/4] mm/damon: add PA-mode cache for eligible memory detection lag
Date: Wed, 25 Feb 2026 16:59:15 -0800
Message-ID: <20260226005916.7950-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CALa+Y14yVxW+NSP6-G+93yHFLKhFhvKMQowGUR1MBcPgvO_q-A@mail.gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-77122-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,kvack.org,vger.kernel.org,linux-foundation.org,lwn.net,gmail.com,micron.com,sk.com];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 57B0D19FABB
X-Rspamd-Action: no action

On Wed, 25 Feb 2026 10:58:15 -0800 Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:

> On Mon, Feb 23, 2026 at 9:54 PM SeongJae Park <sj@kernel.org> wrote:
> >
> > On Mon, 23 Feb 2026 12:32:32 +0000 Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:
[...]
> I agree with dropping this patch for now. Let's focus on getting the
> core metrics merged first.
> The cache mechanism can be revisited later if real-world usage shows
> it's needed.

Thank you for flexibly accepting my suggestion, Ravi.  I hope to continue more
discussions on the issue later.


Thanks,
SJ

[...]

