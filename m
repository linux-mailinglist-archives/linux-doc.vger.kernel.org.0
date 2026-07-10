Return-Path: <linux-doc+bounces-96270-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sr5SJRIBUWpQ9wIAu9opvQ
	(envelope-from <linux-doc+bounces-96270-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 16:26:26 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6C873BB8E
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 16:26:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bd++3JU6;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96270-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96270-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B374305A5F8
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 14:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D79346E68;
	Fri, 10 Jul 2026 14:19:07 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCA9346A08;
	Fri, 10 Jul 2026 14:19:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783693147; cv=none; b=VoNOtmed5/zmO+ODy7efaUe4wGNntXcfiyVfIfSQjr2fK0J3OJSYdAIryG00rH68lVwLIxSyx7DYb/kT/oV/s7e/uZdxjd/mIoJKfRC227Frq+7Z0Ev2y7ODqWDobOuR+DcGaqYFetjLkNWgZCGrDVzo4lUnEzIO2av6C/zDsfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783693147; c=relaxed/simple;
	bh=NOYvfkSM9ca1CqaAcC0JpA3gF5+Y/2UdSzbdKhkKiLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Owu3/F0QrtP2K2fBDaXWzD1soqimmP2Ebe5yuJjV3OgUTemyQK/gRK0pDFJMzJ01j4wc16rMbpBOmqc+KAcf61JBstBjDEoT3mVPBaWKJFdNAfaxL0wL5P8XEORiF79RlNr/tL04AD14mlE0Af4ynpnVImGnjH0HfClHu/aZBhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bd++3JU6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D251F00A3A;
	Fri, 10 Jul 2026 14:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783693146;
	bh=dlb3WD7/szOCNyvIUD9XAK0jmIyFraoZyD8UZq/GPXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bd++3JU6myGmdIMMne53urwP13UFJCmJ7dBhnvgWv5Fmtz9ryc7S9KMuyqEPbopMO
	 Cf6kscvoweWO7QVGoOPMYEENlT8EpH/UnguxrAs4oAe9RqqQLww4YlFOxnn6O9Imtw
	 G5YBpI9tulEdjpz74VJy1oLMZzscuRFxLyAeyReVl9eeqFcyB3rBxL6fF1W72sFJ3L
	 pQfRHmK/n9/ByfYsUzGSuaMEj2V0jsD9u3Uw1l5nMud/dgZnCp/rMxFpI5qhm9qHfT
	 AQ14cl4meMv4mfxaMftZxRxzqpUulZ+gA+ID7ejErCHPOvWnBoNrh4lJhhzPECEt/Z
	 A0XYgiRNFpTcg==
From: SJ Park <sj@kernel.org>
To: Song Hu <husong@kylinos.cn>
Cc: SJ Park <sj@kernel.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/4] Docs/ABI/damon: fix typos
Date: Fri, 10 Jul 2026 07:18:58 -0700
Message-ID: <20260710141859.24919-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260710044737.561102-3-husong@kylinos.cn>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96270-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:husong@kylinos.cn,m:sj@kernel.org,m:damon@lists.linux.dev,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kylinos.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B6C873BB8E

On Fri, 10 Jul 2026 12:47:35 +0800 Song Hu <husong@kylinos.cn> wrote:

> Fix two typos in the DAMON sysfs ABI document:
> 
>   - "WDate:" -> "Date:" on the nr_regions/min entry
>   - "manimum" -> "minimum" in the nr_accesses/min description

Good eyes!

> 
> Signed-off-by: Song Hu <husong@kylinos.cn>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]

