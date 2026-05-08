Return-Path: <linux-doc+bounces-86570-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFQ6Cyt3/mk8rQAAu9opvQ
	(envelope-from <linux-doc+bounces-86570-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 01:52:11 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9AA4FCE89
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 01:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F08A4300B9C9
	for <lists+linux-doc@lfdr.de>; Fri,  8 May 2026 23:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C57368287;
	Fri,  8 May 2026 23:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ALxe9ym2"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BC333B6D5;
	Fri,  8 May 2026 23:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778284324; cv=none; b=Idyz7lPoYIM1YCWk49OaQBAZPk0IapBjH8Fx+m9UMFfoZkLmQ/finq8z1BZUcApKKMIArwqzKU5SS3Gwu0A8CYH6Bttqrc4s4rm4H7t8rcMLNh4OH+HqyqSq2rAvxGoP8YUFoiBLxQZ0HNKl417eiUN5zhJuoLYHmOQ8TW6id0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778284324; c=relaxed/simple;
	bh=sRGeCV6w/1XLJmMiis3Zh7jmQgcOwgTRye0mEg75f10=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=JEiJNdjHA8d+Dr71aqgY3722NKU8a9BuONe8qofG3W6Bko37012qD4vpUnBnY8lSYBq/T3CMHBk1OA6eUsfxoNM9pPMOMDtLCPeERN/6+MUi4QTfGJxo3YNEhUB9lhVGLJW62+BPA6WZIfJ95eMNjeltKu48ByOOl1H0X71QZyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ALxe9ym2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E3FDC2BCB0;
	Fri,  8 May 2026 23:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1778284324;
	bh=sRGeCV6w/1XLJmMiis3Zh7jmQgcOwgTRye0mEg75f10=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ALxe9ym2sHgz7eBUYTEuUFF41oSDC4cz3mXGbV78Dfm+oqqwoIPEWCG2MGsWVZ8Z4
	 +kLExX711p4ifWyTbJVe/8ddxhSROJmkV+x4IqyVtlJY9/t7d0pJNbyrMmNlQj8ehW
	 q/cmtclmZMfOII99C0Y3VrNtwUEN0IxC3cncAWjE=
Date: Fri, 8 May 2026 16:52:03 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Albert Esteve <aesteve@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins
 <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, Rae Moar
 <raemoar63@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org,
 workflows@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-doc@vger.kernel.org, peterz@infradead.org, Alessandro Carminati
 <acarmina@redhat.com>, Guenter Roeck <linux@roeck-us.net>, Kees Cook
 <kees@kernel.org>, Linux Kernel Functional Testing <lkft@linaro.org>,
 =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Dan Carpenter
 <error27@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v9 0/4] kunit: Add support for suppressing warning
 backtraces
Message-Id: <20260508165203.1cd1b27e664754d18dbea899@linux-foundation.org>
In-Reply-To: <20260508-kunit_add_support-v9-0-99df7aa880f6@redhat.com>
References: <20260508-kunit_add_support-v9-0-99df7aa880f6@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1C9AA4FCE89
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-86570-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FREEMAIL_CC(0.00)[arndb.de,linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lwn.net,linuxfoundation.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,vger.kernel.org,googlegroups.com,lists.freedesktop.org,lists.infradead.org,infradead.org,redhat.com,roeck-us.net,linaro.org,igalia.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_TWELVE(0.00)[32];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Fri, 08 May 2026 17:02:44 +0200 Albert Esteve <aesteve@redhat.com> wrote:

> Some unit tests intentionally trigger warning backtraces by passing bad
> parameters to kernel API functions. Such unit tests typically check the
> return value from such calls, not the existence of the warning backtrace.
> 
> ...
> 
> Solve the problem by providing a means to suppress warning backtraces
> originating from the current kthread while executing test code.
> Since each KUnit test runs in its own kthread, this effectively scopes
> suppression to the test that enabled it, without requiring any
> architecture-specific code.

Thanks.  AI review has a bunch of questions:
	https://sashiko.dev/#/patchset/20260508-kunit_add_support-v9-0-99df7aa880f6@redhat.com

