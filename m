Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8E5142DFB
	for <lists+linux-doc@lfdr.de>; Mon, 20 Jan 2020 15:47:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgATOrE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 20 Jan 2020 09:47:04 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37140 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbgATOrE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Jan 2020 09:47:04 -0500
Received: by mail-pl1-f195.google.com with SMTP id c23so13281436plz.4;
        Mon, 20 Jan 2020 06:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oM4ZBnAassx1XUJXMAoOeIhrSmEkpy12LDdYPbIqmKA=;
        b=KZv5ETtyFpDd7uKkvnAc6F+aeJCJDkontmIlzjgi2XQg+eBSFbeAlr/TFrLW1LtBJ6
         zd4Jbq027xukXajPqRp2p7AR4bwA9wEnt05me2iGnlOabke6qNDCZFzKLRxhpg9GXRum
         DwoFtp8/uQtC+cN2MyMJn7Cv1exx23yWgrZhEFmxb+5crPcHLflWa70j19fP2DOhY7F0
         hRIKVVGH/N8AstwKIyOxoED1JrfU9jKB6eAI2qzrMfYrJxQo9SX5Ap+W3BHe174DaV7B
         T/VxI2gIc1d42lAcXJvoxuE0+SPg9ve3OIKpPvOW05vOBamVrNvC5pOakIHche1UwMCy
         uVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oM4ZBnAassx1XUJXMAoOeIhrSmEkpy12LDdYPbIqmKA=;
        b=DQSFLYTNesV0/DPKYteKYdr4dw2FmcmTPK4coF4226hmtKczPr3ovH4DXntMPL59+W
         +bjcHhUpo9vunvx47PyxoAHPUNfVB8M3ubNWMaA9Qd7gNPHcJWQ1y/WAQ69SCk6E8EOj
         7wzsZwR/ATpqz+nEZXYcV6fyi/WWadxP3cs3f9vZ0mYBjf5bf6eCB6Dk7Meo2Fv5jITv
         N+HBxkIaqe3dd949mOtn34A2xtw6gGSMQIF0JZyqlagjCqwyMWZvD9k4/ecRrBUAHlk/
         BEUAe4Yuo7nVaktHHN/qtAjtRBNYqe4mYQMVkZjdoDLWoif5A20q3ywU6ZsF2QCrxmYw
         Qv4w==
X-Gm-Message-State: APjAAAUuJHXpFwlEKdHIP02Ouq1bM3w9Y3JeZdFWQ9aBlgxPGyVrGVN5
        fgyHfT6njuwgzlITqV34NHY=
X-Google-Smtp-Source: APXvYqw78xuh3Ya5bNPce6c93YPzljCUHjOSX+uKRrOTG/liQiQuHh3QJOcjaL+zNbXs/Nmpzfkbsw==
X-Received: by 2002:a17:902:9a8f:: with SMTP id w15mr15206864plp.149.1579531623544;
        Mon, 20 Jan 2020 06:47:03 -0800 (PST)
Received: from localhost (187.100.30.125.dy.iij4u.or.jp. [125.30.100.187])
        by smtp.gmail.com with ESMTPSA id 17sm40601222pfv.142.2020.01.20.06.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 06:47:02 -0800 (PST)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date:   Mon, 20 Jan 2020 23:47:00 +0900
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        lijiazi <jqqlijiazi@gmail.com>, Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        lijiazi <lijiazi@xiaomi.com>
Subject: Re: [PATCH v3 1/3] lib/vsprintf: add two device node flags for %pOF
Message-ID: <20200120144700.GC386200@jagdpanzerIV.localdomain>
References: <54fe6854ede6e2f22eb9775837da1ad7a13a3df4.1579423564.git.lijiazi@xiaomi.com>
 <20200120133652.GA386200@jagdpanzerIV.localdomain>
 <20200120141414.GM32742@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200120141414.GM32742@smile.fi.intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On (20/01/20 16:14), Andy Shevchenko wrote:
> On Mon, Jan 20, 2020 at 10:36:52PM +0900, Sergey Senozhatsky wrote:
> > On (20/01/20 19:38), lijiazi wrote:
> > >  Documentation/core-api/printk-formats.rst | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> > > index 8ebe46b1..9271f20 100644
> > > --- a/Documentation/core-api/printk-formats.rst
> > > +++ b/Documentation/core-api/printk-formats.rst
> > > @@ -441,6 +441,8 @@ Examples::
> > >  							d - detached
> > >  							P - Populated
> > >  							B - Populated bus
> > > +							O - Overlay
> > > +							F - Overlay free cset
> > 
> > I think these 3 can be just one patch. Patching Documentation and
> > vsprintf in separate steps might be a bit inconvenient.
> 
> The new flags addition may be a subject to discuss. That's why I suggested
> to split it out. Though the above misses the functionality for these flags.
> 
> Adding a flag counter to the OF header is orthogonal to printf() changes,
> it may be there independently. So, it should be a separate patch.

Oh, yes! I meant 2 patches, not 3 patches - Documentation and vsprintf().
OF header patch is completely independent. Agreed.

	-ss
