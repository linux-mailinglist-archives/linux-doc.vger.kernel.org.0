Return-Path: <linux-doc+bounces-83756-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gB6ZGOlK42m0EQEAu9opvQ
	(envelope-from <linux-doc+bounces-83756-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 18 Apr 2026 11:12:09 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD134420899
	for <lists+linux-doc@lfdr.de>; Sat, 18 Apr 2026 11:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8FF6303AF3A
	for <lists+linux-doc@lfdr.de>; Sat, 18 Apr 2026 09:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F6A37754C;
	Sat, 18 Apr 2026 09:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eEhQyFXT"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F259A36DA18;
	Sat, 18 Apr 2026 09:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776503509; cv=none; b=lkTtKikbAP4v00wrK6MDSxaC8m2AjqOE5RE8YPbQAdVEcEo9kuplAq6dCF21Ho8yYKX5Cw9QQbBV4MtWkDckurGCRdYEjmDpqRgDWsNGg5OkwxEcnpJILrVJxidl2VaJNLlQLFepsfG29eu+I7jGBakfRfPaTO3e2pB8UgWtEhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776503509; c=relaxed/simple;
	bh=8XrR0J6f/Ozigwen3EtXhgckW7YTfzkoFDQXYPRcQ9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQm75Oab95IdHIhgFXNTGCe/1TNtIz9c0Dbe3QARJOH5jUXTbTJw6GvXUNrrBJdlZCcg8//jftZ0LFThTF2EwRybXzKfT0KOdPLCXB7p8tLCN60G1rYLvLwNgr+y5cUogdtjyeacJf4Rf4XqsTRIoH8rXvE3wumL15LTHryUjyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eEhQyFXT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445E3C19424;
	Sat, 18 Apr 2026 09:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776503508;
	bh=8XrR0J6f/Ozigwen3EtXhgckW7YTfzkoFDQXYPRcQ9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eEhQyFXTsw7IYl8v+r+InRT08KNOYYKUYrHoDxNFUUIF4Oj9epIUFOlpRnBFakm6B
	 495gUhZlSAvTNdYx8pU0EtwH6BTRD62Lct8aF632LTiAUl7WvK/qTAxyEBNeZx3+K/
	 dKiwXbhWB6Zj4Qi5MNqjLn6ryWuUzlifrQcP7hupzM9AznmV99n5Bq7ZAWzJKnbdAp
	 cNrC+V3tOjs8f/Iis086NT4I90Gt8uMVei3KJrM0oP/QIAGUBoTf6mKwXpc6iCH+21
	 /Orp8tGfGbY/sUxYW6cc28QalsG924tUb0ZIubdzlqoPX0xRbbtJZpknFKpk5UjIsJ
	 pwS4xZoXje4Vg==
Date: Sat, 18 Apr 2026 10:11:41 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Nick Huang <sef1548@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: Add overview and SLUB allocator sections to slab
 documentation
Message-ID: <aeNKDh8S6pXHqRFh@lucifer>
References: <20260418000635.17499-1-sef1548@gmail.com>
 <aeMQ36jFnCKmCSyA@casper.infradead.org>
 <CABZAGREDHwsXMm65_WxEn=v-zTv7_eVqQzQeCRqU2Gyc0aTETQ@mail.gmail.com>
 <CABZAGRGFpiiEr7Odd5an1+9Z+sX1C6QT2iadv-0hNhxGj8eEyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABZAGRGFpiiEr7Odd5an1+9Z+sX1C6QT2iadv-0hNhxGj8eEyg@mail.gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83756-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:email]
X-Rspamd-Queue-Id: BD134420899
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 18, 2026 at 02:12:22PM +0800, Nick Huang wrote:
> Nick Huang <sef1548@gmail.com> 於 2026年4月18日週六 下午1:27寫道：
> >
> > Matthew Wilcox <willy@infradead.org> 於 2026年4月18日週六 下午1:04寫道：
> > >
> > > On Sat, Apr 18, 2026 at 12:06:19AM +0000, Nick Huang wrote:
> > > > - Add "Overview" section explaining the slab allocator's role and purpose
> > > > - Document the three main slab allocator implementations (SLAB, SLUB, SLOB)
> Hi Matthew Wilcox
> I will remove this sentence in the next version:
> “Document the three main slab allocator implementations (SLAB, SLUB, SLOB).”
> I’m not entirely sure I fully understand your point. If I’ve missed
> anything, please let me know what needs to be changed. Thank you.

No, please don't send any more revisions of this garbage, thanks.

