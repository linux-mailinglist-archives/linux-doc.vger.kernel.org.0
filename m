Return-Path: <linux-doc+bounces-91552-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id js55CYTYJ2r93AIAu9opvQ
	(envelope-from <linux-doc+bounces-91552-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 11:10:28 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A9C65E1FF
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 11:10:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=W82I8wBU;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91552-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-91552-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 760113106EDE
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 09:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01CB92E091E;
	Tue,  9 Jun 2026 09:02:11 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE918194AE6;
	Tue,  9 Jun 2026 09:02:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995730; cv=none; b=CYJ7LoeNKcYZxT54YG/CXHYihmofHzZsL3zjUOtAZvVP9HTttwuoS5YgSM1YdLfIKEm5xe/TQU9IGteMsLU1q9qig6um5z0wwCSEYgiDWzGeAAMRhI2XhNEOrU3HhQVRAZ8KoQ7/x92sEhtmOxPu5UrqrwazjJ+il1PM4VTD0WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995730; c=relaxed/simple;
	bh=X3kZXLgoD4loR4hnj6Wp7oHH03sW8coNdu2AD6gnsos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HMbGROZ4CK+MpNkBPv5s6TBvfOTi2bJkreAOfr/L3ncZFSNy9gTnm9CniC4nBn89MzJ8yQmpEST2pNGVPiYy5PSHMw1nmYNL261zwp7NVsV733oQv7Z8fjxsz2cA6/QRHZ6lawovwH2bk5tymFSq72tAaCrRUHERJ6gwYNGYyds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W82I8wBU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CB431F00893;
	Tue,  9 Jun 2026 09:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780995729;
	bh=WWSmiCs23IJGI57Vs2GNr1UcM+JoQenB5W5KVqFSLKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W82I8wBU6gWYB5R991WEtHqMaAfW+LFNWdS8l8tEheYLu4CVNM9JEP7htjvZC+80M
	 B12yPMW/uhwP6yVvtWD5OJp5CxS6cE0WkZBYZaic1kO5cIAKOlw2gYhxtYL+3HaV3h
	 3GhbYPJ9HoAqYsPxFSJ48yWXfdQFHycX9vkgTj5AxRPo68dYkjZWBRJ6CEzIHXUI27
	 AzHAbqnyFgXPsSkniSHtNe//p9sYgCgSEa1+MvM1LHMqCsx7dNaWk2XSiqkefVQj8J
	 Q41OZTKjqvL8BHtOzt2rI4cgSYcpOfQmm3kCGaTnEV3nH7CfkHP+X0TbfAaHfJtudW
	 act8fdFCNhhRQ==
Date: Tue, 9 Jun 2026 09:02:05 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev,
	tfiga@chromium.org, senozhatsky@chromium.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 3/3] PM: dpm_watchdog: Add sysctl interface for DPM
 watchdog timeouts
Message-ID: <aifWjW93SOQiv_Eh@google.com>
References: <20260608021526.1023248-1-tzungbi@kernel.org>
 <20260608021526.1023248-4-tzungbi@kernel.org>
 <CAJZ5v0j=Uey90jN-TiUkx+FEPKtNUWhDGrfhxke65Em_ycbc+w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0j=Uey90jN-TiUkx+FEPKtNUWhDGrfhxke65Em_ycbc+w@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:corbet@lwn.net,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:skhan@linuxfoundation.org,m:pavel@kernel.org,m:lenb@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:tfiga@chromium.org,m:senozhatsky@chromium.org,m:rdunlap@infradead.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tzungbi@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-91552-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 86A9C65E1FF

On Mon, Jun 08, 2026 at 04:22:35PM +0200, Rafael J. Wysocki wrote:
> On Mon, Jun 8, 2026 at 4:16 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > Introduce sysctl knobs to allow configuring DPM watchdog timeouts at
> > runtime.
> >
> > Currently, these timeouts are fixed at compile time via
> > CONFIG_DPM_WATCHDOG_TIMEOUT and CONFIG_DPM_WATCHDOG_WARNING_TIMEOUT.
> > This limits flexibility if the timeouts need to be adjusted for
> > different testing scenarios or hardware behaviors without rebuilding
> > the kernel.
> >
> > Add the following sysctl files under /proc/sys/kernel/:
> > - dpm_watchdog_timeout_secs: The total timeout before panic. The
> >   maximum value is capped at CONFIG_DPM_WATCHDOG_TIMEOUT to prevent
> >   unreasonably large timeouts.
> > - dpm_watchdog_warning_timeout_secs: The warning timeout. The maximum
> >   value is capped at the current dpm_watchdog_timeout_secs.
> > Both sysctls have a minimum value of 1.
> >
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> > ---
> > v3:
> > - No changes.
> >
> > v2: https://lore.kernel.org/all/20260604090756.2884671-4-tzungbi@kernel.org
> > - New to the series.
> >
> > v1: Doesn't exist.
> >
> >  drivers/base/power/main.c | 61 ++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 57 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> > index 7822c29b7c8d..c1a4b30fafb2 100644
> > --- a/drivers/base/power/main.c
> > +++ b/drivers/base/power/main.c
> > @@ -28,6 +28,7 @@
> >  #include <linux/interrupt.h>
> >  #include <linux/sched.h>
> >  #include <linux/sched/debug.h>
> > +#include <linux/sysctl.h>
> >  #include <linux/async.h>
> >  #include <linux/suspend.h>
> >  #include <trace/events/power.h>
> > @@ -539,6 +540,58 @@ static bool __read_mostly dpm_watchdog_enabled =
> >  module_param(dpm_watchdog_enabled, bool, 0644);
> >  MODULE_PARM_DESC(dpm_watchdog_enabled, "Enable DPM watchdog");
> >
> > +static unsigned int __read_mostly dpm_watchdog_timeout = CONFIG_DPM_WATCHDOG_TIMEOUT;
> > +static unsigned int __read_mostly dpm_watchdog_warning_timeout =
> > +                                               CONFIG_DPM_WATCHDOG_WARNING_TIMEOUT;
> > +static const unsigned int dpm_watchdog_timeout_max = CONFIG_DPM_WATCHDOG_TIMEOUT;
> > +
> > +static int proc_dodpm_watchdog_timeout_secs(const struct ctl_table *table,
> > +                                           int write, void *buffer,
> > +                                           size_t *lenp, loff_t *ppos)
> > +{
> > +       struct ctl_table ctl = *table;
> > +       unsigned int val = dpm_watchdog_timeout;
> > +       int ret;
> > +
> > +       ctl.data = &val;
> > +       ret = proc_douintvec_minmax(&ctl, write, buffer, lenp, ppos);
> > +       if (ret || !write)
> > +               return ret;
> > +
> > +       if (val < dpm_watchdog_warning_timeout)
> > +               dpm_watchdog_warning_timeout = val;
> > +       dpm_watchdog_timeout = val;
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct ctl_table dpm_watchdog_sysctls[] = {
> > +       {
> > +               .procname       = "dpm_watchdog_timeout_secs",
> > +               .maxlen         = sizeof(unsigned int),
> > +               .mode           = 0644,
> > +               .proc_handler   = proc_dodpm_watchdog_timeout_secs,
> > +               .extra1         = SYSCTL_ONE,
> > +               .extra2         = (void *)&dpm_watchdog_timeout_max,
> > +       },
> > +       {
> > +               .procname       = "dpm_watchdog_warning_timeout_secs",
> > +               .data           = &dpm_watchdog_warning_timeout,
> > +               .maxlen         = sizeof(unsigned int),
> > +               .mode           = 0644,
> > +               .proc_handler   = proc_douintvec_minmax,
> > +               .extra1         = SYSCTL_ONE,
> > +               .extra2         = (void *)&dpm_watchdog_timeout,
> > +       },
> > +};
> > +
> > +static int __init dpm_watchdog_sysctl_init(void)
> > +{
> > +       register_sysctl_init("kernel", dpm_watchdog_sysctls);
> > +       return 0;
> > +}
> > +subsys_initcall(dpm_watchdog_sysctl_init);
> > +
> >  /**
> >   * dpm_watchdog_handler - Driver suspend / resume watchdog handler.
> >   * @t: The timer that PM watchdog depends on.
> > @@ -564,9 +617,9 @@ static void dpm_watchdog_handler(struct timer_list *t)
> >                         dev_driver_string(wd->dev), dev_name(wd->dev));
> >         }
> >
> > -       time_left = CONFIG_DPM_WATCHDOG_TIMEOUT - CONFIG_DPM_WATCHDOG_WARNING_TIMEOUT;
> > +       time_left = dpm_watchdog_timeout - dpm_watchdog_warning_timeout;
> >         dev_warn(wd->dev, "**** DPM device timeout after %u seconds; %u seconds until panic ****\n",
> > -                CONFIG_DPM_WATCHDOG_WARNING_TIMEOUT, time_left);
> > +                dpm_watchdog_warning_timeout, time_left);
> >         show_stack(wd->tsk, NULL, KERN_WARNING);
> >
> >         wd->fatal = true;
> > @@ -587,11 +640,11 @@ static void dpm_watchdog_set(struct dpm_watchdog *wd, struct device *dev)
> >
> >         wd->dev = dev;
> >         wd->tsk = current;
> > -       wd->fatal = CONFIG_DPM_WATCHDOG_TIMEOUT == CONFIG_DPM_WATCHDOG_WARNING_TIMEOUT;
> > +       wd->fatal = dpm_watchdog_timeout == dpm_watchdog_warning_timeout;
> >
> >         timer_setup_on_stack(timer, dpm_watchdog_handler, 0);
> >         /* use same timeout value for both suspend and resume */
> > -       timer->expires = jiffies + HZ * CONFIG_DPM_WATCHDOG_WARNING_TIMEOUT;
> > +       timer->expires = jiffies + HZ * dpm_watchdog_warning_timeout;
> >         add_timer(timer);
> >  }
> >
> > --
> 
> I think that this can be applied without the other two patches in the
> series, so please let me know if you want me to apply it separately.

Ack.  The patch does have adjacent hunks with the preceding patch, which
might cause minor contextual conflicts if applied independently.

Would you want me to reorder the series in the next version to make this
the first patch?  In case the rest two patches may still take some time
to review.

