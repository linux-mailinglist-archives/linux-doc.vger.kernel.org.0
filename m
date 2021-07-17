Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 242283CC664
	for <lists+linux-doc@lfdr.de>; Sat, 17 Jul 2021 22:55:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235272AbhGQU6D (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 17 Jul 2021 16:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233585AbhGQU6C (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 17 Jul 2021 16:58:02 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2EABC061762
        for <linux-doc@vger.kernel.org>; Sat, 17 Jul 2021 13:55:05 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id a6so7063667pgw.3
        for <linux-doc@vger.kernel.org>; Sat, 17 Jul 2021 13:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AzejeF7pARl9nvNZ/SKXjtBr8tSI+wQVjunUNUziOkA=;
        b=yG/94pT++KysRkRR7Ee9X/reRZojfKEcZDLOovFdsOCIl6tMAHuE4febS8dZjRq5on
         KakPilolQePL2d3aMUyd0sD2TpYRm3tFxj9hcX+iuHw+lTBEHfYq8POysMd5FJbVILZq
         b8CQb+EfVh6yJZzKi3jm+4bSd90uJQgsJBmJLGe3ZJSJIYCLeIkEdLUyG4qCERiR/D3Y
         CLFZxGYQ2TrtobRV/SdNOcMAnBKcFjZrQJtjrVYq7LWy4xElrWV7FvFTn060p8a4rY4U
         adR8o5Jt47WSv1Zror7vG7WmZ4dkwESOOo1I1AuekVMbzXvKduiajK3Zbz5E0/tyNsPV
         XgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AzejeF7pARl9nvNZ/SKXjtBr8tSI+wQVjunUNUziOkA=;
        b=dhqwDzFNp20hfnFwGxt3Nv3gDav2mb6SH5rQnmUqmveEg0p6ZBXG8iuwHFgdUve1Rg
         HsOgVw2vkyBox00cbsLxn3Hrz08kzAOXrXgPDCwL2yI4bJPnaeId4yF4TzVn3aJNQ9b2
         HLTphgRJKri+/DFxY12UyhGwZuflBPRfy3ISOo6otTuVXhFDLaTqj+Q3fvCDKkifS4qk
         DPVRbWSmxMdFJSP2qiiB+bn2+mvb8DhVvkooQiZR4LeNNSlYF88TXFdRjAKrZLxSJ4qC
         cJSFD4sikhwU/a1jHETGcKvHGm6CyS5hKYUe43qtT4CuO+vt1KFAOEwkocRLEdEt65VE
         RqSA==
X-Gm-Message-State: AOAM533M5C9EjRd7lPVZD5nLa1Lg9VwrGJ9HhU/ySKvlFgneiIVRZ1mQ
        Ys+KhCgpu4CoTzwf4TeL8i5Crw1QHZQEHg/DPjryeg==
X-Google-Smtp-Source: ABdhPJwegUQnpKKeNNS0aeS1tIibmSwIVu8h0HW57Wt8a6q24xYnmH9VFR5v+d9CeKf0ktP85MKfdE2UMTwvnwW1EYI=
X-Received: by 2002:a65:6248:: with SMTP id q8mr16976866pgv.279.1626555305105;
 Sat, 17 Jul 2021 13:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-7-iwona.winiarska@intel.com> <59428599ef7efb2521bd62c49a3bc55c710f29de.camel@intel.com>
 <6807a14deb52956ad2fe390b1811dd98901a642a.camel@intel.com>
 <CAPcyv4ifjCZSUuk5H5qw6sjt5vdAkTfNzd+4imu+9e_iOt74gQ@mail.gmail.com> <YPJ05JUiOggKajIx@kroah.com>
In-Reply-To: <YPJ05JUiOggKajIx@kroah.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Sat, 17 Jul 2021 13:54:54 -0700
Message-ID: <CAPcyv4iuP=uSEWyd+N65FpasQidtN82tW8q-dvf_qT7_FMiTsw@mail.gmail.com>
Subject: Re: [PATCH 06/14] peci: Add core infrastructure
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc:     "Winiarska, Iwona" <iwona.winiarska@intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>,
        "Lutomirski, Andy" <luto@kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Luck, Tony" <tony.luck@intel.com>,
        "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "bp@alien8.de" <bp@alien8.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "x86@kernel.org" <x86@kernel.org>,
        "pierre-louis.bossart@linux.intel.com" 
        <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jul 16, 2021 at 11:13 PM gregkh@linuxfoundation.org
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jul 16, 2021 at 02:50:04PM -0700, Dan Williams wrote:
> > On Fri, Jul 16, 2021 at 2:08 PM Winiarska, Iwona
> > > > > +}
> > > > > +EXPORT_SYMBOL_NS_GPL(peci_controller_add, PECI);
> > > >
> > > > I think it's cleaner to declare symbol namespaces in the Makefile. In
> > > > this case, add:
> > > >
> > > > cflags-y += -DDEFAULT_SYMBOL_NAMESPACE=PECI
> > > >
> > > > ...and just use EXPORT_SYMBOL_GPL as normal in the C file.
> > > >
> > >
> > > I kind of prefer the more verbose EXPORT_SYMBOL_NS_GPL - it also
> > > doesn't "hide" the fact that we're using namespaces (everything is in
> > > the C file rather than mixed into Makefile), but it's not a strong
> > > opinion, so sure - I can change this.
> > >
> >
> > Perhaps as a tie breaker, the maintainer you are submitting this to,
> > Greg, uses the -DDEFAULT_SYMBOL_NAMESPACE scheme in his subsystem,
> > drivers/usb/.
>
> We did that because namespaces were added _after_ the kernel code was
> already there.  For new code like this, the original use of
> EXPORT_SYMBOL_NS_GPL() is best as it is explicit and obvious.  No need
> to dig around in a Makefile to find out the namespace name.

Fair enough.

/me goes to update drivers/cxl/
