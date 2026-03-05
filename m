Return-Path: <linux-doc+bounces-78109-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDfLHBgNqmlbKQEAu9opvQ
	(envelope-from <linux-doc+bounces-78109-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 06 Mar 2026 00:09:12 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3702192D3
	for <lists+linux-doc@lfdr.de>; Fri, 06 Mar 2026 00:09:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DC79302E910
	for <lists+linux-doc@lfdr.de>; Thu,  5 Mar 2026 23:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B52364E9E;
	Thu,  5 Mar 2026 23:09:07 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FCC3644BD;
	Thu,  5 Mar 2026 23:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772752147; cv=none; b=F0yq/JxhbI1jURJDWOWVrMJ0ykgQ5RZr88Giidf7uhIz8Edl56YzwJQpQrzCAMbXzB3LRngcKrXTvP8h3UQfz1x1Kp9hPkaswbvXZMuLg3yp02Glut+t6ZzOmXpHOZksLaNZWcxP+USXXSWi40jmHsb4/tLFoJ+Ho6SOgUsToWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772752147; c=relaxed/simple;
	bh=cRBXowwMx8f+4eUc6cscyBmZz4ZjEsdQxTE+c+eax9k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ehVq1+SNYR9nJypEHJKZ+YdBeI7HsvqdtyCJNkqHRWEl5tiTNKjEwaSNBLsnaLDftO9Hv4KevPaxT33uVkqVDS+Qq45hDSMm5uXUjCTJyUxDt2nP0HbXnt6kqHuHVSMQN5W5ynHO1+LLzvI3EHSIuosgEcHi/Bh4KEB6V0cU9Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf11.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 2574B57F1F;
	Thu,  5 Mar 2026 23:09:05 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf11.hostedemail.com (Postfix) with ESMTPA id E870320029;
	Thu,  5 Mar 2026 23:09:02 +0000 (UTC)
Date: Thu, 5 Mar 2026 18:09:02 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: "Ahmed S. Darwish" <darwi@linutronix.de>, Jonathan Corbet
 <corbet@lwn.net>, Clark Williams <clrkwllms@kernel.org>,
 linux-rt-devel@lists.linux.dev, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, John Ogness <john.ogness@linutronix.de>, Derek
 Barbosa <debarbos@redhat.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] Documentation: real-time: Add kernel
 configuration guide
Message-ID: <20260305180902.300fece5@gandalf.local.home>
In-Reply-To: <aanwC228bGTa38LK@casper.infradead.org>
References: <20260305205023.361530-1-darwi@linutronix.de>
	<20260305205023.361530-2-darwi@linutronix.de>
	<aanwC228bGTa38LK@casper.infradead.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: y61g89knifynbjocw11ks4186nt7y7k9
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+WRo6Tr1qE0GLKBnPRl01fQ2wfyP5ThFU=
X-HE-Tag: 1772752142-441956
X-HE-Meta: U2FsdGVkX1+fTAj5vA+b77zBDGTIcr/NDhHbaVWe2jadqVUvMCH1+xrdMNB7LN1Q7T+1Y1/lY/1mDWQZ7m42jKrzpgvJX8GhRjFFuCjawN3U2VAJglCv2mjKs6uRlX99yZpSfIiqpBHOi5hSkqrrR5MoiL2aOL+Jmlrz1Qf6anPe7qlsh9ER07+NkdG0N44ZdATKPKfNwA73LMJ2kefyCcDRgXcF69OuZAOU9bpwvWT815I/Xfjqr3tzNVRuGg3DsIm2+O5nBopCgjO7bhMZ8/tVdkjtNmRThQXFEIyffcoAC9TB1FKv8Q1sJY4wIUD/Eun/YSdPuWIWaUOqyXzoW8NNM7PT5q5xNtn8rBlzh78G3dyeQAd2/nmiMTvjw5fs1p44ewjpvk8ryVpwrXByRQ==
X-Rspamd-Queue-Id: CC3702192D3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_HAM(-0.00)[-0.994];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-78109-lists,linux-doc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Action: no action

On Thu, 5 Mar 2026 21:05:15 +0000
Matthew Wilcox <willy@infradead.org> wrote:

> > +With that in mind, any false real-time kernel configuration could cause a  
> 
> incorrect rather than false, perhaps?

Heh, I just read this now after making the same comment.

-- Steve

