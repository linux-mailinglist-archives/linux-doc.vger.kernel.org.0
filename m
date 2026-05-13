Return-Path: <linux-doc+bounces-87393-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILGFMH+rBGoxMwIAu9opvQ
	(envelope-from <linux-doc+bounces-87393-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 18:49:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4305C53767A
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 18:49:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0B453063DCC
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 16:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27FC84C77D9;
	Wed, 13 May 2026 16:41:16 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAC841C310;
	Wed, 13 May 2026 16:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778690476; cv=none; b=ghNyaUNu19vp9KPV0KgMfZllUmX3Bco7a1lF4QES53FSW0h/QwlJsgfw2zurJBdTa+RA8i9jcDUOIzdrmcaN+NgjzIur5ob3upc7J79O7l1N2ygRIFfAi/oVyt+J4nu7+CtIjetP/ihY5UUNDiwhRzzZXo/xKY4TqTH7HQtUtOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778690476; c=relaxed/simple;
	bh=s9fYP+qY0LZpCTN4Q7vKTRfdKJMfrvho8omGyB3eS5g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YKFXigbp4EBzF0bmOcmfREhVAoVMpUqRk1uFRYlZQLuHftkS6BgHb55V2LZe5vq/Tj+MuiTb+OV6RxpJbMuSSatyrpEpUbCEJfiTS0Yic0r5tB3lLPI5n5ZC+zD7ScnhTEL8tma5ZTIC8Q7lDNWyrSCkS4iFpZ8DlmNrdP28OXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf20.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id B7CDC1C02D2;
	Wed, 13 May 2026 16:41:10 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf20.hostedemail.com (Postfix) with ESMTPA id E522920026;
	Wed, 13 May 2026 16:41:04 +0000 (UTC)
Date: Wed, 13 May 2026 12:41:07 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Aaron Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@lwn.net>,
 Song Liu <song@kernel.org>, KP Singh <kpsingh@kernel.org>, Matt Bobrowski
 <mattbobrowski@google.com>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Jiri Olsa <jolsa@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Yonghong Song <yonghong.song@linux.dev>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Randy Dunlap
 <rdunlap@infradead.org>, neelx@suse.com, sean@ashe.io, chjohnst@gmail.com,
 steve@abita.co, mproche@gmail.com, nick.lange@gmail.com, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
 linux-trace-kernel <linux-trace-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v3] bpf: introduce TAINT_UNSAFE_BPF for mutating
 helpers
Message-ID: <20260513124107.437431f0@gandalf.local.home>
In-Reply-To: <CAADnVQLw+_NaOVeaKabuf085wNo_-6MAv8w0EDO3fBz3KCQT5g@mail.gmail.com>
References: <20260503164700.548164-1-atomlin@atomlin.com>
	<CAADnVQJ5fatNF4auH+a8E39zWMfja3rm4BM_xGcTnLX8uuCQ9Q@mail.gmail.com>
	<20260513111331.7bede512@gandalf.local.home>
	<CAADnVQL_sWznA+JJLdzP_ZdUgQeO7p-AGnOtx9=fXjH+PnRJBA@mail.gmail.com>
	<20260513112307.53e77312@gandalf.local.home>
	<CAADnVQLw+_NaOVeaKabuf085wNo_-6MAv8w0EDO3fBz3KCQT5g@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Stat-Signature: fg3i9cunj58jazg91jw7fxhf6rjuzr1t
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/vlIIxtheuPq6Yf9zUCAmaImOQIxA+vjQ=
X-HE-Tag: 1778690464-121100
X-HE-Meta: U2FsdGVkX1/y8lI1aHXZZgaOrrPr0GIPYKwzSJkHfS8iNP88ZMeiSieyt1fIozfVTcDewb8vfRsjt9C0BHfEkz1RXXx1/hCApMKwnvvGF/SrwZtEqlwMo0MmjZ43bbJ3u6LNnrkekV4TA7NuPbsXoVZmD6WtJFgTrAVVzycfc/50B8hlzcXmT9XLyqATqm6RPzzsgEGpEOa9M2I5b5wtCmOw105zBeuFmt8YqzPZTBwSG+PT8msrsRMihJM0fDSJUZWHONK2MQQPpb4d/crfisCRB7fnZXjlCJ0NtY8HtXUUpji0JJkdBj36vGrAxobrBpv8L55TkepC/bIUfz2J6zl2SeCKa9jGi30T0xLtsAHs8MEVYkosTecwWGqERxXQZWylqJ19jTxA9y9/hjfIsg==
X-Rspamd-Queue-Id: 4305C53767A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87393-lists,linux-doc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[atomlin.com,lwn.net,kernel.org,google.com,iogearbox.net,gmail.com,linuxfoundation.org,linux.dev,efficios.com,infradead.org,suse.com,ashe.io,abita.co,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,goodmis.org:email]
X-Rspamd-Action: no action

On Wed, 13 May 2026 09:35:29 -0700
Alexei Starovoitov <alexei.starovoitov@gmail.com> wrote:

> On Wed, May 13, 2026 at 8:23=E2=80=AFAM Steven Rostedt <rostedt@goodmis.o=
rg> wrote:
> >
> > On Wed, 13 May 2026 08:16:07 -0700
> > Alexei Starovoitov <alexei.starovoitov@gmail.com> wrote:
> > =20
> > > It's impossible to track all modifications.
> > > See what sched-ext is doing.
> > > What does it modify? Everything. =20
> >
> > What about just having a list of what BPF programs are loaded, what they
> > may be attached to, and what kfuncs they are calling? =20
>=20
> Ohh. These have been available forever.
> Just bpftool prog, bpftool link, bpftool prog dump xlated

Ah thanks. That is useful.

-- Steve

