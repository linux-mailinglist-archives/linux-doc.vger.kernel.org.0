Return-Path: <linux-doc+bounces-90722-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bdtVJvEOIGrnvAAAu9opvQ
	(envelope-from <linux-doc+bounces-90722-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 13:24:33 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2837A637009
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 13:24:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=BPBVxQ2V;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90722-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-90722-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3810430A4CB4
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 11:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B5F331203;
	Wed,  3 Jun 2026 11:21:51 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77589449EA4;
	Wed,  3 Jun 2026 11:21:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780485711; cv=none; b=h0dEMCVkSj5NHTH8585LSeHIAs7ZpHGEmHyY+JubPm/wZN5kYbBt1mOSMzGQk1AizMXhGKGQ3GFc6Clq2BuvtXO3F6+YcEMOcuFu+m+yWW6zFeu2AwnxntsQUAHmZHL6OTpxunJcoQLunBvuRtz0bLg6gaCnyr9PUh9r7Rsh+Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780485711; c=relaxed/simple;
	bh=sfx1tvNRErDF1HTfIALai0SM6G/2WCKioBj6QNPwX3A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YOKARQ8wLuMB/YH/iMgjrD/C76IVCvRwTaiw8xhfecv7K99dSxgJftIi39ztlAVTmhj9yeXKpmt9oIVkRTRvhZ/IfwUR2jfx/TDE8Zc+UnOdxYpdDR4yva5cWp7n2rL1gPWBbr92rfFOIhOZ/N9GKnTqrZsu3CzgZqZ5Ci+Sk1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=BPBVxQ2V; arc=none smtp.client-ip=80.241.56.171
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gVlSt62QVz9tyP;
	Wed,  3 Jun 2026 13:14:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780485246; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sfx1tvNRErDF1HTfIALai0SM6G/2WCKioBj6QNPwX3A=;
	b=BPBVxQ2VOQAmNjCBS/CsdXEc93Uxz5hNgeSYzCzuxZ4ngIWUoTZNfdBP5vIjzMQj0kBM+P
	Kdl6ilr9GRoN2ML5piHR18evBZ4FgrFuw0cshQbkRPARaCNVGLWx63IQienE4wVNFKZr9E
	EFhOtnhzMO1P/jWnKEzI14hcZ5pPvU1vaA0Wu5L//63pm+Lg575BehyMPZfko2WTQ8kzfT
	Y2z6I6kmx02CeMtQD803CG1O1WrzXFq/xzzzIvpSNWqdL6pfKJD4vmgibezueqg+UnFKGs
	zh3E1IQay3huth/SSctwXfEigcz3iajI4+bMjYS5xcKmXd3bxpB3NE1atKSRiQ==
Message-ID: <c6ecda00eb1aa6a88c17354e26d4dd7dc58ae582.camel@mailbox.org>
Subject: Re: [PATCH] Documentation: drm: Add entry for removing spsc_queue
 to TODO list
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Stanner <phasta@kernel.org>, avid Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>,  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann	
 <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan	
 <skhan@linuxfoundation.org>, dakr@kernel.org, Tvrtko Ursulin	
 <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 03 Jun 2026 13:14:01 +0200
In-Reply-To: <aceb688b-4f65-4539-a4f1-fc5455b60a5f@amd.com>
References: <20260529215207.115513-2-phasta@kernel.org>
	 <aceb688b-4f65-4539-a4f1-fc5455b60a5f@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: bihjw5wo6xpk91679khq9hpsnwrfqzps
X-MBO-RS-ID: 4831e0c02127252da33
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:phasta@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:dakr@kernel.org,m:tvrtko.ursulin@igalia.com,m:dri-devel@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[amd.com,kernel.org,gmail.com,ffwll.ch,linux.intel.com,suse.de,lwn.net,linuxfoundation.org,igalia.com];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-90722-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-doc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:mid,mailbox.org:from_mime,mailbox.org:dkim,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2837A637009

On Mon, 2026-06-01 at 10:30 +0200, Christian K=C3=B6nig wrote:
>=20
>=20
> On 5/29/26 23:52, Philipp Stanner wrote:
> > drm_sched contains a lockless queue (spsc_queue) that seems to be
> > useless and potentially unsound.
> >=20
> > Add a TODO list entry for replacing spsc_queue with a locked list.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
>=20
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Pushed to drm-misc-next

Thx
P.

>=20
> > ---
> > =C2=A0Documentation/gpu/todo.rst | 41 +++++++++++++++++++++++++++++++++=
+++++
> > =C2=A01 file changed, 41 insertions(+)
> >=20
> > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > index cdddf8db35f5..87e082b0eb48 100644
> > --- a/Documentation/gpu/todo.rst
> > +++ b/Documentation/gpu/todo.rst
> > @@ -948,6 +948,47 @@ Contact: Philipp Stanner <phasta@kernel.org>
> > =C2=A0
> > =C2=A0Level: Intermediate
> > =C2=A0
> > +Replace the lockless queue with a locked list
> > +---------------------------------------------
> > +
> > +drm_sched is the only user in the entire kernel of a special lockless =
queue, the
> > +spsc_queue. This queue utilizes:
> > +
> > +- preempt_disable()
> > +- atomic instructions
> > +- memory barriers
> > +- ACCESS_ONCE()
> > +
> > +whereas a conventional spinlock utilizes:
> > +
> > +- preempt_disable()
> > +- 1 atomic instruction for taking / releasing the lock
> > +- memory barriers
> > +
> > +Moreover, drm_sched_entity_push_job(), the only user of spsc_queue_pus=
h(), has
> > +to take a lock in some situations anyways and calls to it are often se=
rialized
> > +with a driver lock.
> > +
> > +It is, thus, highly questionable whether the lockless queue grants any=
 advantage
> > +at all. Considering that its internals are not well documented and its=
 correctness
> > +is not formally proven, it seems desirable to replace the queue with a=
 mere list
> > +or hlist that is protected by a spinlock.
> > +
> > +Tasks:
> > +
> > +- Replace the spsc_queue in drm/sched (and those who might access the =
scheduler's
> > +=C2=A0 internal queue) with a spinlock + (h)list.
> > +- Ideally, check with some micro benchmarks and real world tests (pref=
erably
> > +=C2=A0 with amdgpu) for relevant performance regressions.
> > +- Remove the spsc_queue from the kernel altogether.
> > +
> > +Contact:
> > +
> > +- Philipp Stanner <phasta@kernel.org>
> > +- Christian K=C3=B6nig <christian.koenig@amd.com>
> > +
> > +Level: Beginner
> > +
> > =C2=A0Outside DRM
> > =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =C2=A0

