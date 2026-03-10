Return-Path: <linux-doc+bounces-78620-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JwtLenlr2nkdAIAu9opvQ
	(envelope-from <linux-doc+bounces-78620-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 10 Mar 2026 10:35:37 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 979CB2488A9
	for <lists+linux-doc@lfdr.de>; Tue, 10 Mar 2026 10:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D296C305AEE8
	for <lists+linux-doc@lfdr.de>; Tue, 10 Mar 2026 09:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657B543E9F4;
	Tue, 10 Mar 2026 09:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hIUHh3w0"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB1343E9C6;
	Tue, 10 Mar 2026 09:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773135017; cv=none; b=WC4ZsN+5Klyldpqd3z5i6ciLvwnXLtnMVvhzA8Aj6Vupza2TK7Plq7/xZPvwIcOnXHlwNmQAJGN74Idz4vVzPdfDynTzroiDjUffjByXx4o/qTtG4CFPQ1xWgb7M10Nk20oj1XyKLMuWSFdfF4sWUL5j8J/SLlrpRQOjLA8HQcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773135017; c=relaxed/simple;
	bh=nQ8AFJwvR5OUsBOuBKedxLD969aJf4vk2lwmCGOgvu8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=r7U2P9n4omIQEY9WJ/6qZSov5af2A+FpoTE5tmeEEdRbNYVNWOwrrpJHDCFw6u2LHfYv0KtNIFIUCMzYlABsp7hqXwFZlms26p1ri3q+8+R5yUbCH1p6ebTB8XBp8HLgDSbn3pjSqxm+DybVrIWLNcb7ZVVhdTd42w15ZZHjjMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hIUHh3w0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773135016; x=1804671016;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=nQ8AFJwvR5OUsBOuBKedxLD969aJf4vk2lwmCGOgvu8=;
  b=hIUHh3w0XdqsdAE/8JyozcXB05bwdL6ufHYPMqt7aCzbet/TgsURu4yi
   uX3bCpX5qzzjhtKV9qAV9hpeJPA2OO2VIcTTBWcnr1QYAq86gFbQ0BACX
   TUSqqsDJHe/PW6A3BpyuNPM7B6LSAPtpX8szP+E0wUNjhbR5cWPrgLvDJ
   CO6fiLtXhQk8dvqMYNtaQieFygmvwkKWwRLxZWpelHlZth3GbJ9XmyLjS
   rXqa7uQ5AQLuCJ02tgrP3jc99FVXMQgqvbYiVV7D6rnImLBuNEhnTyOLf
   dDPYPvSpOvhZ0l1y4brnKUj79+8UBEsGzbEnlbpuL99ZSwJ+GVttQrWFL
   g==;
X-CSE-ConnectionGUID: Ec6v+4N3S4OXniBRrHyOSQ==
X-CSE-MsgGUID: EFfTuh13TumWuxlDGnk1eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84886259"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="84886259"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 02:30:15 -0700
X-CSE-ConnectionGUID: AuJOtJojRrqCX5lt7KpKuQ==
X-CSE-MsgGUID: aGNFE+3STzOG7pjxFFOqAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="224513921"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.55])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 02:30:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 10 Mar 2026 11:30:07 +0200 (EET)
To: Vishnu Sankar <vishnuocv@gmail.com>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, dmitry.torokhov@gmail.com, 
    hmh@hmh.eng.br, Hans de Goede <hansg@kernel.org>, corbet@lwn.net, 
    derekjohn.clark@gmail.com, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, ibm-acpi-devel@lists.sourceforge.net, 
    linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
    vsankar@lenovo.com
Subject: Re: [PATCH v7 1/3] input: trackpoint - Enable doubletap by default
 on capable devices
In-Reply-To: <CABxCQKt_1Hv2hPDpzQQ3TxFJWbRNHs-vRDi9hNhBq4oaoGkt3w@mail.gmail.com>
Message-ID: <8216aaaf-bdaa-2a48-a7de-b0b81d49eda5@linux.intel.com>
References: <20260209063355.491189-1-vishnuocv@gmail.com> <20260209063355.491189-2-vishnuocv@gmail.com> <fdd1d48e-61b7-2543-8a30-c7ad416f5dd3@linux.intel.com> <CABxCQKtf=RYrpgnbM0ODo3GA0oW3jgR=_erc9RCD6gEasasA+A@mail.gmail.com> <0df2daf8-31ee-4fe3-fc38-de138b302549@linux.intel.com>
 <CABxCQKt_1Hv2hPDpzQQ3TxFJWbRNHs-vRDi9hNhBq4oaoGkt3w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-2011260643-1773134910=:975"
Content-ID: <4e383c9d-d7d3-1fed-7dce-ab28f9f3cfd7@linux.intel.com>
X-Rspamd-Queue-Id: 979CB2488A9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[squebb.ca,gmail.com,hmh.eng.br,kernel.org,lwn.net,vger.kernel.org,lists.sourceforge.net,lenovo.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-78620-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,intel.com:email,squebb.ca:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2011260643-1773134910=:975
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <a387f5ec-759a-f740-7eee-091e1525fb64@linux.intel.com>

On Tue, 10 Mar 2026, Vishnu Sankar wrote:

> Hi Ilpo,
>=20
> Thank you.
>=20
> On Tue, Mar 10, 2026 at 6:15=E2=80=AFPM Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > On Tue, 10 Mar 2026, Vishnu Sankar wrote:
> >
> > > Hi Ilpo,
> > >
> > > Thank you so much for the review.
> > >
> > > On Mon, Mar 9, 2026 at 5:01=E2=80=AFPM Ilpo J=C3=A4rvinen
> > > <ilpo.jarvinen@linux.intel.com> wrote:
> > > >
> > > > On Mon, 9 Feb 2026, Vishnu Sankar wrote:
> > > >
> > > > > Enable doubletap functionality by default on TrackPoint devices t=
hat
> > > > > support it. The feature is detected using firmware ID pattern mat=
ching
> > > > > (PNP: LEN03xxx) with a deny list of incompatible devices.
> > > > >
> > > > > This provides immediate doubletap functionality without requiring
> > > > > userspace configuration. The hardware is enabled during device
> > > > > detection, while event filtering continues to be handled by the
> > > > > thinkpad_acpi driver as before.
> > > > >
> > > > > Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> > > > > Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > > > > Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > > ---
> > > > > Changes in v7:
> > > > > - Removed unwanted comments
> > > > > - Removed psmouse_info ()
> > > > >
> > > > > Changes in v6:
> > > > > - No Changes
> > > > >
> > > > > Changes in v5:
> > > > > - Renamed function to trackpoint_is_dt_capable()
> > > > > - Simplified string comparison without sscanf()
> > > > > - Removed wrapper function as suggested
> > > > > - Fixed missing period in comment
> > > > >
> > > > > Changes in v4:
> > > > > - Simplified approach: removed all sysfs attributes and user inte=
rface
> > > > > - Enable doubletap by default during device detection
> > > > > - Removed global variables and complex attribute infrastructure
> > > > > - Uses minimal firmware ID detection with deny list
> > > > > - Follows KISS principle as suggested by reviewers
> > > > >
> > > > > Changes in v3:
> > > > > - No changes
> > > > >
> > > > > Changes in v2:
> > > > > - Improve commit messages
> > > > > - Sysfs attributes moved to trackpoint.c
> > > > > - Removed unnecessary comments
> > > > > - Removed unnecessary debug messages
> > > > > - Using strstarts() instead of strcmp()
> > > > > - is_trackpoint_dt_capable() modified
> > > > > - Removed _BIT suffix and used BIT() define
> > > > > - Reverse the trackpoint_doubletap_status() logic to return error=
 first
> > > > > - Removed export functions as a result of the design change
> > > > > - Changed trackpoint_dev->psmouse to parent_psmouse
> > > > > - The path of trackpoint.h is not changed
> > > > > ---
> > > > >  drivers/input/mouse/trackpoint.c | 45 ++++++++++++++++++++++++++=
++++++
> > > > >  drivers/input/mouse/trackpoint.h |  5 ++++
> > > > >  2 files changed, 50 insertions(+)
> > > > >
> >
> > > > > diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mou=
se/trackpoint.c
> > > > > index 5f6643b69a2c..e12d76350252 100644
> > > > > --- a/drivers/input/mouse/trackpoint.c
> > > > > +++ b/drivers/input/mouse/trackpoint.c
> >
> > > > > +     /* Must start with "PNP: LEN03" */
> > > > > +     if (!strstarts(pnp_id, "PNP: LEN03"))
> > > >
> > > > Missing include.
> > >
> > > Sorry, I am a bit confused here:
> > > strstarts() is already available through the existing
> > > #include <linux/string.h> in thinkpad_acpi.c.
> > >
> > > Do you think I should do anything else here?
> >
> > Yes.
> >
> > The file you're modifying in this patch is trackpoint.c which doesn't
> > have that include so please add it also there. :-)
> Aaah, Sorry!!. Got it.
> I=E2=80=99ll add the missing #include <linux/string.h>
> Thank you for pointing it out.

Thanks. Please also double check you added inux/array_size.h into the=20
correct file in case you were confused what file this patch modifies.

--=20
 i.
--8323328-2011260643-1773134910=:975--

