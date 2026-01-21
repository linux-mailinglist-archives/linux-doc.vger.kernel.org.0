Return-Path: <linux-doc+bounces-73398-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAdJDo2ZcGlyYgAAu9opvQ
	(envelope-from <linux-doc+bounces-73398-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jan 2026 10:17:01 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0CB54329
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jan 2026 10:17:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EE955586559
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jan 2026 09:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2114338BDA3;
	Wed, 21 Jan 2026 09:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b8rAJXsy"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF74346779;
	Wed, 21 Jan 2026 09:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768986502; cv=none; b=S/DHdaHtyhfFwlNDGZyiP8tINyDGDSny1MseS3UfSYFIp0ljHfnprD3NtyZjIZ4NDP2ZjYC/xg63WxhHe28aaUHFrkQ10SQVzb3rL914mLLeRKfxpJs47+M9CYu5J8NQPYp0EJSgjYoEZxwKEZqCCYExDGCwSxJcA8vdVSBCBAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768986502; c=relaxed/simple;
	bh=klnW2xK3hLbSk0oSDnMsm7oDxbD9b6k31GzqJeQ/ENU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=h/uhLvk+uPkPYuVNymuiK35t65Q7olLrXGO6zzVE/mT7uN7XsMOLXggZ/hhjsF/xG4eZUxLD+N2xwHEdrx0IDAEWaHJLhIOvMVyMff5f4YXB5gjtr43zFe4kq1itElbIMnf4O66dVCFVDammmdpYhIyeuUTn6Q1p8SXNSSYCAeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b8rAJXsy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D605FC116D0;
	Wed, 21 Jan 2026 09:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768986501;
	bh=klnW2xK3hLbSk0oSDnMsm7oDxbD9b6k31GzqJeQ/ENU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=b8rAJXsyuS5ZqbcaoonsyMMvS+0OJ/BHwUKCrjyM3ZPqOMXpJlszbF3SZ6CEGTA8Y
	 cdrYTwCLBXoOktteI9ekXo+g0DstSxvMayjoZJfCUYcXhss90qB77NFltDVPPkw0jV
	 94FgkKhHbUL5AjBdHKucrwzeBYHNe9ooL2DTRdoPrDd8BRGtBwr+qo3UoEGaygmVxU
	 IO3kOzeuycxb+0AmUCafoxci3gBejYB1m4nGkzgRwZyeLRJbu4IeALHgp8odUov0xD
	 1PAB4wFPj+jgmLuJrH9AgNPfC0ghTpkknonCIC0/WYWa/d2NhaSmaXGs/hsgXlmXcn
	 5/IYfxvgtVssA==
Date: Wed, 21 Jan 2026 10:08:18 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
cc: "Derek J . Clark" <derekjohn.clark@gmail.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    "Limonciello, Mario" <mario.limonciello@amd.com>, 
    Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
    "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
    linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/16] HID: hid-lenovo-go: Add Lenovo Legion Go Series
 HID Driver
In-Reply-To: <2910bb2e-6b31-42f3-a3de-463327b16ff1@app.fastmail.com>
Message-ID: <24on5sn2-2726-84q2-635q-9245n343qqrp@xreary.bet>
References: <20251229031753.581664-1-derekjohn.clark@gmail.com> <20251229031753.581664-3-derekjohn.clark@gmail.com> <0on4p9s6-7512-9408-49no-3292o86113r3@xreary.bet> <6BB4F74A-F440-4F21-B094-62CFD18C599A@gmail.com>
 <2910bb2e-6b31-42f3-a3de-463327b16ff1@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,amd.com,lenovo.com,valvesoftware.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-73398-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jikos@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,xreary.bet:mid]
X-Rspamd-Queue-Id: CE0CB54329
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 12 Jan 2026, Mark Pearson wrote:

> >>I am now almost finished with reviewing this pile and am planning to queue 
> >>it in hid.git shortly, but I have a question regarding the MAINTAINERS 
> >>entry above.
> >>
> >>The title claims support for all of Lenovo HID, but there is much more to 
> >>it than drivers/hid/hid-lenovo-go.c, specifically in hid-lenovo.c.
> >>
> >>So either please make the title more specific (or claim the ownership of 
> >>the whole Lenovo HID landscape indeed, fine by me, but the please reflect 
> >>that in F: :) ).
> >>
> >>Thanks,
> >>
> >
> > Hi Jiri
> >
> > Sure, I've debated using LENOVO LEGION GO HID drivers and LENOVO GO HID 
> > drivers. Do you have a preference? 

Either works, as far as I am concerned.

> > The other drivers are pretty old and I don't have any hardware that 
> > would use them so I'd prefer to keep them separate (though I'll 
> > acknowledge that they don't seem to have a MAINTAINERS entry)
> >
> I should probably take a better look at the lenovo-hid driver.
> 
> The platforms that it's supporting weren't in the Linux program, so it 
> never crossed my path before - but looking ahead I think we may need to 
> contribute some changes there (guessing a little, but I'll know in a few 
> months time).
> 
> Jiri - as that driver is targeted for Thinkpads, I'm OK to take some 
> responsibility for it if that is useful/helpful.

Perfect, could you please then either send that as a followup patch, or 
even have it included right as part of Derek's series?

Thanks,

-- 
Jiri Kosina
SUSE Labs


