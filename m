Return-Path: <linux-doc+bounces-16668-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 026B28CAE22
	for <lists+linux-doc@lfdr.de>; Tue, 21 May 2024 14:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC6A2282D0C
	for <lists+linux-doc@lfdr.de>; Tue, 21 May 2024 12:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2B86CDC0;
	Tue, 21 May 2024 12:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="lGLfg6/v"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675F742076
	for <linux-doc@vger.kernel.org>; Tue, 21 May 2024 12:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716294365; cv=none; b=SznBizKXrmGxgVMinWTsY91sSgJwXH9uf/pf4wxQ7tX9jnXKB0YdZP7ywOZFbZamKWVOWDcVQyYe4mflq3JwkIlYPeW42tvjVBjnV4lBkVKPdy53e05yuO1Ihkp5ClUNNfr3MMI5mF4unmKjAziOOlvsfJBrtvAxnkpldD4nfCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716294365; c=relaxed/simple;
	bh=e3FeemwfVGogJlKVgEzIdHKe3B73R9pNmOj9gCNkGt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APoeaP0+2CN9yafB8LelS/bv6bRLEi3aCXbJ5A/b5A6v8ku6aSAA1XvRB5q9R0uvY7qCu9yN4Kj6nCNhh7w3ggSF0PCrjNQviyFPCmLT7aNNeUwQKk2r/Z2lOKTWMjuRmOXEv3NgEtG4vLZ+GYTxSxf/JytqHVHvvp2aTXRxE20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=lGLfg6/v; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a599b74fd49so49158466b.2
        for <linux-doc@vger.kernel.org>; Tue, 21 May 2024 05:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1716294361; x=1716899161; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RdRNtZABzSdYhamYjWVVxK02xAUTnq7URjJCd5KnlOs=;
        b=lGLfg6/v9KjAonRDSQftWbY5HbjJxSaEp28YrdSHL/Sk/mWMSAW8NAAAtSoLONuKV1
         RbuWbjBAOQLOtHNUnlkjaMQFtiuu1RNAlVRtZyOu8w2i91pkaYYfyCCX0NVrh+k4uZHM
         +4OsJz6urgAd7tzX44ol/ctieuQGjpNJ/mXbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716294361; x=1716899161;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RdRNtZABzSdYhamYjWVVxK02xAUTnq7URjJCd5KnlOs=;
        b=wete4Sw2dSsYWQRBlV4om/JMoxuYbIPTElQo2YvG/tNswdAfVH+XhQokuV0IiZXXSr
         BHr0zCxp/1qB5vMdmiyc3Y0z77UoypVnY3EyHn3SLdf4/HT395Z3D2DRqfQNxF+4y81t
         6hnwj72cY+ShU9HlQzpejkids7HvxjF+6bchAxyEhdBu4sfJZupd8hj44/iUGVHzJEPp
         1AibJ25zfQ7cqO0JikCsqQ1aeorO5ASQynok1spaDsDYm6ynusSrVTl7U902L2FszHeM
         pMaK5ftPqO4TJxX1TeSOFIoI2F/niYxDWdaPbvEahZaEU/DnAd7E3WFw6C9w8CMEWERP
         v/GA==
X-Forwarded-Encrypted: i=1; AJvYcCVt23Ax9OGQnGBcpkgHjLf7RBWq7WCR6Hrc/cYuxOKTwUvwJqQeQqknntuZeUusHGcjzwRvrUjk4RYEYnnPorthYD5tNMTyIlWY
X-Gm-Message-State: AOJu0YzkSFcc1Z89Cdy3u/cGSBGED9Ipqk4uLvsprS16c0QPg6I61zJs
	d/byWOzaOgbYBo12dRUNzPXxh3ClkXVIsN6AjXkCF/8ewX516q52mdaS1cZhmtg=
X-Google-Smtp-Source: AGHT+IHxhnAGFUScDl3IlqhfMmQn0o9GDUXBNO57XpFrPU+//uAG7drXpi7vj0AI2MW2rT7JliFGlQ==
X-Received: by 2002:a17:906:f591:b0:a5a:5bf2:b889 with SMTP id a640c23a62f3a-a5a5bf2b8b4mr2570842966b.0.1716294360690;
        Tue, 21 May 2024 05:26:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a61c18561casm239391966b.91.2024.05.21.05.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 05:25:56 -0700 (PDT)
Date: Tue, 21 May 2024 14:25:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
	Jim Shargo <jshargo@google.com>, daniel@ffwll.ch,
	brpol@chromium.org, corbet@lwn.net, dri-devel@lists.freedesktop.org,
	hamohammed.sa@gmail.com, hirono@chromium.org, jshargo@chromium.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	mairacanal@riseup.net, marius.vlad@collabora.com,
	mduggan@chromium.org, melissa.srw@gmail.com, mripard@kernel.org,
	rodrigosiqueiramelo@gmail.com, tzimmermann@suse.de
Subject: Re: [PATCH v6 0/7] Adds support for ConfigFS to VKMS!
Message-ID: <ZkyS0q9GnCzla2EV@phenom.ffwll.local>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Jim Shargo <jshargo@google.com>, brpol@chromium.org, corbet@lwn.net,
	dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
	hirono@chromium.org, jshargo@chromium.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	mairacanal@riseup.net, marius.vlad@collabora.com,
	mduggan@chromium.org, melissa.srw@gmail.com, mripard@kernel.org,
	rodrigosiqueiramelo@gmail.com, tzimmermann@suse.de
References: <ZjCtgSaL50YrS-F-@phenom.ffwll.local>
 <20240508181744.7030-1-jose.exposito89@gmail.com>
 <CACmi3jF6Dp3PE8X=T5kTO2+eYJQi7jWACFdmp9jzKxUtcQphnQ@mail.gmail.com>
 <Zj5JIah0jWnIn2Ix@localhost.localdomain>
 <ZkHKhtBmyS12i3fH@fedora>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZkHKhtBmyS12i3fH@fedora>
X-Operating-System: Linux phenom 6.8.9-amd64 

On Mon, May 13, 2024 at 10:08:38AM +0200, José Expósito wrote:
> On Fri, May 10, 2024 at 06:19:45PM +0200, Louis Chauvet wrote:
> > Le 09/05/24 - 18:18, Jim Shargo a écrit :
> > > Sima--thanks SO MUCH for going through with everything leaving a
> > > detailed review. I am excited to go through your feedback.
> > > 
> > > It makes me extremely happy to see these patches get people excited.
> > > 
> > > They've bounced between a few people, and I recently asked to take
> > > them over again from the folks who were most recently looking at them
> > > but haven't since had capacity to revisit them. I'd love to contribute
> > > more but I am currently pretty swamped and I probably couldn't
> > > realistically make too much headway before the middle of June.
> > > 
> > > José--if you've got capacity and interest, I'd love to see this work
> > > get in! Thanks!! Please let me know your timeline and if you want to
> > > split anything up or have any questions, I'd love to help if possible.
> > > But most important to me is seeing the community benefit from the
> > > feature.
> > > 
> > > And (in case it got lost in the shuffle of all these patches) the IGT
> > > tests really make it much easier to develop this thing. Marius has
> > > posted the most recent patches:
> > > https://lore.kernel.org/igt-dev/?q=configfs
> > > 
> > > Thanks!
> > > -- Jim
> > > 
> > > 
> > > 
> > > On Wed, May 8, 2024 at 2:17 PM José Expósito <jose.exposito89@gmail.com> wrote:
> > > >
> > > > Hi everyone,
> > > >
> > > > I wasn't aware of these patches, but I'm really glad they are getting
> > > > some attention, thanks a lot for your review Sima.
> > > >
> > > > Given that it's been a while since the patches were emailed, I'm not
> > > > sure if the original authors of the patches could implement your
> > > > comments. If not, I can work on it. Please let me know.
> > > >
> > > > I'm working on a Mutter feature that'd greatly benefit from this uapi
> > > > and I'm sure other compositors would find it useful.
> > > >
> > > > I'll start working on a new version in a few days if nobody else is
> > > > already working on it.
> > > >
> > > > Best wishes,
> > > > José Expósito
> > 
> > Hi all!
> > 
> > Very nice to see other people working on this subject. As the series 
> > seemed inactive, I started two weeks ago to rebase it on top of [1]. I 
> > also started some work to use drmm_* helpers instead of using lists in 
> > vkms. I currently struggle with a deadlock during rmmod.
> > 
> > I need to clean my commits, but I can share a WIP version.
> 
> Hi Louis,
> 
> If you could share a RFC/WIP series it would be awesome!
> 
> Since you are already working on the kernel patches (and I guess IGT?),
> I'll start working on a libdrm high level API to interact with VKMS from
> user-space on top of your patches. I'll share a link as soon as I have a
> draft PR.

Great to see all the enthusiasm here, this is awesome.

Note that I'm out of office for two weeks next week, so if I miss any
patches please ping me again (sima in #dri-devel on oftc tends to work
best) when I'm back.

> > Maybe we can discuss a bit the comment from Daniel (split init between 
> > default/configfs, use or not a real platform device...)
> > 
> > For the split, I think the first solution (struct vkms_config) can be 
> > easier to understand and to implement, for two reasons:
> > - No need to distinguish between the "default" and the "configfs" devices 
> >   in the VKMS "core". All is managed with only one struct vkms_config.
> > - Most of the lifetime issue should be gone. The only thing to 
> >   synchronize is passing this vkms_config from ConfigFS to VKMS.
> 
> I agree, this seems like the easiest solution.
> 
> > The drawback of this is that it can become difficult to do the "runtime" 
> > configuration (today only hotplug, but I plan to add more complex stuff 
> > like DP emulation, EDID selection, MST support...). Those configuration 
> > must be done "at runtime" and will require a strong synchronization with 
> > the vkms "core".
> > 
> > Maybe we can distinguish between the "creation" and the "runtime 
> > configuration", in two different configFS directory? Once a device is 
> > created, it is moved to the "enabled" directory and will have a different 
> > set of attribute (connection status, current EDID...)
> 
> Once the device is enabled (i.e, `echo 1 > /config/vkms/my-device/enabled`),
> would it make sense to use sysfs instead of another configfs directory?
> The advantage is that with sysfs the kernel controls the lifetime of the
> objects and I think it *might* simplify the code, but I'll need to write a
> proof of concept to see if this works.

sysfs is very opinionated about lifetime, so we might actually make this
more complicated. Plus for the only thing we can hotplug (connectors) we
already have sysfs directories, so there could be a lifetime/name fight
between the sysfs interfaces to prepare a hotplugged connector, and the
connector sysfs files which are part of the existing uapi.

Also the second issue I'm seeing is that we're mixing up
testing/configuration apis with the generic uapi that should hold for
every kms driver. This could make the code in igt testcase or for driving
compositor end-to-end testcases a lot more confusing. I think separation
would be better.

The third point I'm seeing is that connectors can be created both before
we create the device, and at runtime. If we have two totally separate
interfaces for this, we might end up with needless code duplication.

But it's a complex topic, I think it does make sense to give sysfs some
serious thought. But maybe as part of the vkms driver directory, and not
in the drm_device chardev directories. So we could have some separation
that way maybe?

> > For the platform driver part, it seems logic to me to use a "real" 
> > platform driver and a platform device for each pipeline, but I don't have 
> > the experience to tell if this is a good idea or not.
> 
> I'm afraid I don't know which approach could work better. Trusting Sima and
> Maíra on this one.

As I've said, I'm not opposed to a switch. I just think it's an orthogonal
issue to the configfs and should be separately justified.

We're trying hard to get away from kms userspace sneaking too much under
the hood of the driver, and have gone a long way from the o.g. drm days
where "everything is pci" was encoded into uapi. So from that pov I kinda
like the fact that vkms is special and fairly free-floating.

But maybe userspace does want to be able to test their device enumeration
more like a real device, so if vkms currently sticks out there that would
be a really good reason to change things and make it look more like a real
driver/device.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

