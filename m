Return-Path: <linux-doc+bounces-80990-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEc7DtCpwmkyggQAu9opvQ
	(envelope-from <linux-doc+bounces-80990-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 16:12:16 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E7491317C28
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 16:12:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1BB7F304E186
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 15:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFFAA4035D6;
	Tue, 24 Mar 2026 15:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="fYStLhUi"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-bc0d.mail.infomaniak.ch (smtp-bc0d.mail.infomaniak.ch [45.157.188.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82750405AD8
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 15:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774364776; cv=none; b=ua66hocn69LfnpigVKA8uKmdguYT7yweS5MlSxHT3rwrstDZolnYKOzkBfqY8bODelgbWNqZXG0XbWymp9tYa58JbaCX0G924b4UqHDSO5fk76uyoUZV/Jx5S/EgXOF5HlBlGqp0rzgdIUnckcw9h6RpyZDcuxoQ7ue7HKV8dqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774364776; c=relaxed/simple;
	bh=c2gb/FNBBagWrS1XVKZ3P96gfYZYYcvX2+2LtJPkQxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z2W9yQe0g1H3ntj9qocys+ffKXnSVmDkMl2z01npY1MzS2ZZTXSMFs+ovljZAjEnQUMvuTsg3RTgZsl2vieIJrpp3NlyYoQ3EcK+qVsoj02dosafeHhQBodFtj7RlnnIB2gqaSavL2lVbm0uzKwpRm6V/L/etAVSJ430fSW63uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=fYStLhUi; arc=none smtp.client-ip=45.157.188.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fgCzL4N8tz12Vc;
	Tue, 24 Mar 2026 16:06:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1774364766;
	bh=Jmu6wWTlmezDVq+veZoOrDH/dJwq3wLCXrKIoQI3uxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fYStLhUiScxTb6yLxOIdLcAzjcTJmG5YGmMFzQCEhVNeQCY+CsJJtrmpCHFosEMye
	 2nZff9Ve9VrT03IDW6gOHpyWN8AX1MMPz/eRkPkgaMlkxzdi+QBhZ7zKTdw3SYIpmp
	 TcEaFVoJYPLkHN8jCRmrDO5LJfQbs2Lcb0enSoDc=
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4fgCzK5C43zpXq;
	Tue, 24 Mar 2026 16:06:05 +0100 (CET)
Date: Tue, 24 Mar 2026 16:06:01 +0100
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
Cc: "Panagiotis \"Ivory\" Vasilopoulos" <git@n0toose.net>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dan Cojocaru <dan@dcdev.ro>
Subject: Re: [PATCH v4] landlock: Expand restrict flags example for ABI
 version 8
Message-ID: <20260324.aqu5Eic7Thee@digikod.net>
References: <20260304-landlock-docs-add-tsync-example-v4-1-819a276f05c5@n0toose.net>
 <20260323.sheiHaR5uRoo@digikod.net>
 <acJa_56LtPeeH956@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acJa_56LtPeeH956@google.com>
X-Infomaniak-Routing: alpha
X-Spamd-Result: default: False [-0.99 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.67)[subject];
	R_DKIM_ALLOW(-0.20)[digikod.net:s=20191114];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[digikod.net:+];
	TAGGED_FROM(0.00)[bounces-80990-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[digikod.net];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mic@digikod.net,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dcdev.ro:email,n0toose.net:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E7491317C28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 10:48:29AM +0100, Günther Noack wrote:
> Hello!
> 
> On Mon, Mar 23, 2026 at 07:56:21PM +0100, Mickaël Salaün wrote:
> > Thanks!  I pushed your patch in next with a minor fix.
> > 
> > Günther, does it look good to you?
> > 
> > On Wed, Mar 04, 2026 at 07:13:04PM +0100, Panagiotis "Ivory" Vasilopoulos wrote:
> > > Add LANDLOCK_RESTRICT_SELF_TSYNC to the backwards compatibility example
> > > for restrict flags. This introduces completeness, similar to that of
> > > the ruleset attributes example. However, as the new example can impact
> > > enforcement in certain cases, an appropriate warning is also included.
> > > 
> > > Additionally, I modified the two comments of the example to make them
> > > more consistent with the ruleset attributes example's.
> > > 
> > > Signed-off-by: Panagiotis 'Ivory' Vasilopoulos <git@n0toose.net>
> > > Co-developed-by: Dan Cojocaru <dan@dcdev.ro>
> > > Signed-off-by: Dan Cojocaru <dan@dcdev.ro>
> > > ---
> > > Changes in v4:
> > > - Make warning somewhat more terse, merge comments.
> > >   - Remove some sensationalization. ("Don't copy-paste this just yet!")
> > >   - Apply Günther's suggestion (v3 "recycled" some phrases, was long)
> > >     - ... but also retain some of the wording on ABI differences
> > > - Provide a brief overview that contextualizes the example further:
> > >   - Clarify the difference behind ABI < 8 & ABI v8, to avoid
> > >     misunderstandings on which option is the default.
> > >   - Make "linear reading" easier.
> > > - Based on Mickaël's feedback: Avoid cans of worms w.r.t. use cases
> > > - Link to v3: https://lore.kernel.org/r/20260228-landlock-docs-add-tsync-example-v3-1-140ab50f0524@n0toose.net
> > > 
> > > Changes in v3:
> > > - Add __attribute__((fallthrough)) like in earlier example.
> > > - Improve comment for LANDLOCK_RESTRICT_SELF_TSYNC (ABI < 8) example.
> > > - Add relevant warning for ABI < 8 example based on Günther's feedback.
> > > - Link to v2: https://lore.kernel.org/r/20260221-landlock-docs-add-tsync-example-v2-1-60990986bba5@n0toose.net
> > > 
> > > Changes in v2:
> > > - Fix formatting error.
> > > - Link to v1: https://lore.kernel.org/r/20260221-landlock-docs-add-tsync-example-v1-1-f89383809eb4@n0toose.net
> > > ---
> > >  Documentation/userspace-api/landlock.rst | 22 ++++++++++++++++++----
> > >  1 file changed, 18 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/Documentation/userspace-api/landlock.rst b/Documentation/userspace-api/landlock.rst
> > > index 13134bccdd39d78ddce3daf454f32dda162ce91b..64c7138a788d74f99da0a71428da392b3d873bf8 100644
> > > --- a/Documentation/userspace-api/landlock.rst
> > > +++ b/Documentation/userspace-api/landlock.rst
> > > @@ -196,13 +196,27 @@ similar backwards compatibility check is needed for the restrict flags
> > >  (see sys_landlock_restrict_self() documentation for available flags):
> > >  
> > >  .. code-block:: c
> > > -
> > > -    __u32 restrict_flags = LANDLOCK_RESTRICT_SELF_LOG_NEW_EXEC_ON;
> > > -    if (abi < 7) {
> > > -        /* Clear logging flags unsupported before ABI 7. */
> > > +    __u32 restrict_flags =
> > > +        LANDLOCK_RESTRICT_SELF_LOG_NEW_EXEC_ON |
> > > +        LANDLOCK_RESTRICT_SELF_TSYNC;
> > > +    switch (abi) {
> > > +    case 1 ... 6:
> > > +        /* Clear logging flags unsupported for ABI < 7 */
> > >          restrict_flags &= ~(LANDLOCK_RESTRICT_SELF_LOG_SAME_EXEC_OFF |
> > >                              LANDLOCK_RESTRICT_SELF_LOG_NEW_EXEC_ON |
> > >                              LANDLOCK_RESTRICT_SELF_LOG_SUBDOMAINS_OFF);
> > > +        __attribute__((fallthrough));
> > > +    case 7:
> > > +        /*
> > > +         * Removes multithreaded enforcement flag unsupported for ABI < 8
> > > +         *
> > > +         * WARNING: Without this flag, calling landlock_restrict_self(2) is
> > > +         * only equivalent if the calling process is single-threaded. Below
> > > +         * ABI v8 (and as of ABI v8, when not using this flag), a Landlock
> > > +         * policy would only be enforced for the calling thread and its
> > > +         * children (and not for all threads, including parents and siblings).
> > > +         */
> > > +        restrict_flags &= ~LANDLOCK_RESTRICT_SELF_TSYNC;
> > >      }
> > >  
> > >  The next step is to restrict the current thread from gaining more privileges
> > > 
> > > ---
> > > base-commit: ceb977bfe9e8715e6cd3a4785c7aab8ea5cd2b77
> > > change-id: 20260221-landlock-docs-add-tsync-example-e8fd5c64a366
> > > 
> > > Best regards,
> > > -- 
> > > Panagiotis "Ivory" Vasilopoulos <git@n0toose.net>
> > > 
> > > 
> 
> Apologies for the delay, this must have slipped through the cracks.
> Thanks for bringing it up again.  Yes, this looks good.
> 
> Signed-off-by: Günther Noack <gnoack@google.com>

Shouldn't it be a Reviewed-by?

