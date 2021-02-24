Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D62F324711
	for <lists+linux-doc@lfdr.de>; Wed, 24 Feb 2021 23:45:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235614AbhBXWno (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 24 Feb 2021 17:43:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55660 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235475AbhBXWnh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Feb 2021 17:43:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614206529;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7loNY6a/CYvNtMJopL3QUeRwqTiWCpARGe5VL/q/8gs=;
        b=PgRL9zUgUEx2Y6UNAxqZ3EIlqc1bwxTKkwc5W0mL+ugBE3aB3vrE8I0ca2h1LOQPjKCqtd
        Hl1dRuv34ztev2/IUMNZMmOP9jXYqkqHQPCAJR3sFzyFrmziY5LeP7DjDKkoVnqtsTp/Cv
        Vzz7iVsPAGQH0J0o+cBz+1hq7Nj+uus=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-AB9k3j22PhWA307oEsDXbA-1; Wed, 24 Feb 2021 17:42:07 -0500
X-MC-Unique: AB9k3j22PhWA307oEsDXbA-1
Received: by mail-ej1-f69.google.com with SMTP id mm18so1533199ejb.7
        for <linux-doc@vger.kernel.org>; Wed, 24 Feb 2021 14:42:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7loNY6a/CYvNtMJopL3QUeRwqTiWCpARGe5VL/q/8gs=;
        b=SNsmzr0DOucRJmUBbCqBGNUWTZ+3OPtnc0fJHrJtRbGgw60GEGCk6DXTNtMfhBdJ0O
         NfiDhSYjcNZiQrKxu+8TeMBreyp/n+HGrit+K7BZsiKtqbihbM6454ZMjSP69EenjVfS
         mW7pumBXLyWBbvRxFP6WKYuUgFECLJ98LNsgBiupG/0WE1NB6Gcp45uO8eXAHsMjqSn/
         D52UjeyBJW8QqvP0AvPJQb0bJc0Roa5uJc+7QiyTT5r0fOuJfu97KrJh6l/hzgpiPq6f
         Xdy5m5UYxk40WV2c/nw6gaDWy0uxS5p8W1gDAm5O6CoNgsBEBWw5TpdgqTMOfDTCS90c
         RYxA==
X-Gm-Message-State: AOAM5309zBjdpjod49Z1otjeh0UWEvddMDdhhZ4eT8QphAbH1IA0hPai
        /T4hKyu2OXJBYZTj/ySajHFpUy1hDhcexAOq1Ruo5cIcv25mvqjhpXJEAOwQj2CP88gorCmbA9J
        j9yn2IGYUsCNwCYcVYQAi
X-Received: by 2002:aa7:c905:: with SMTP id b5mr45131edt.161.1614206525814;
        Wed, 24 Feb 2021 14:42:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxX6wHCinOs4mbPbm2b7t4ZXywkzoSCLQSDAz3ddGk0HJEmKYxvUxfEaGzcRz0oxz/i60stnA==
X-Received: by 2002:aa7:c905:: with SMTP id b5mr45085edt.161.1614206525568;
        Wed, 24 Feb 2021 14:42:05 -0800 (PST)
Received: from redhat.com (212.116.168.114.static.012.net.il. [212.116.168.114])
        by smtp.gmail.com with ESMTPSA id w24sm2387595edv.67.2021.02.24.14.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 14:42:04 -0800 (PST)
Date:   Wed, 24 Feb 2021 17:41:59 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Alexander Graf <graf@amazon.com>
Cc:     Adrian Catangiu <acatan@amazon.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, qemu-devel@nongnu.org,
        kvm@vger.kernel.org, linux-s390@vger.kernel.org,
        gregkh@linuxfoundation.org, rdunlap@infradead.org, arnd@arndb.de,
        ebiederm@xmission.com, rppt@kernel.org, 0x7f454c46@gmail.com,
        borntraeger@de.ibm.com, Jason@zx2c4.com, jannh@google.com,
        w@1wt.eu, colmmacc@amazon.com, luto@kernel.org, tytso@mit.edu,
        ebiggers@kernel.org, dwmw@amazon.co.uk, bonzini@gnu.org,
        sblbir@amazon.com, raduweis@amazon.com, corbet@lwn.net,
        mhocko@kernel.org, rafael@kernel.org, pavel@ucw.cz,
        mpe@ellerman.id.au, areber@redhat.com, ovzxemul@gmail.com,
        avagin@gmail.com, ptikhomirov@virtuozzo.com, gil@azul.com,
        asmehra@redhat.com, dgunigun@redhat.com, vijaysun@ca.ibm.com,
        oridgar@gmail.com, ghammer@redhat.com
Subject: Re: [PATCH v7 1/2] drivers/misc: sysgenid: add system generation id
 driver
Message-ID: <20210224173205-mutt-send-email-mst@kernel.org>
References: <1614156452-17311-1-git-send-email-acatan@amazon.com>
 <1614156452-17311-2-git-send-email-acatan@amazon.com>
 <20210224040516-mutt-send-email-mst@kernel.org>
 <d63146a9-a3f8-14ea-2b16-cb5b3fe7aecf@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d63146a9-a3f8-14ea-2b16-cb5b3fe7aecf@amazon.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 24, 2021 at 02:45:03PM +0100, Alexander Graf wrote:
> > Above should try harder to explan what are the things that need to be
> > scrubbed and why. For example, I personally don't really know what is
> > the OpenSSL session token example and what makes it vulnerable. I guess
> > snapshots can attack each other?
> > 
> > 
> > 
> > 
> > Here's a simple example of a workflow that submits transactions
> > to a database and wants to avoid duplicate transactions.
> > This does not require overseer magic. It does however require
> > a correct genid from hypervisor, so no mmap tricks work.
> > 
> > 
> > 
> >          int genid, oldgenid;
> >          read(&genid);
> > start:
> >          oldgenid = genid;
> >          transid = submit transaction
> >          read(&genid);
> >          if (genid != oldgenid) {
> >                          revert transaction (transid);
> >                          goto start:
> >          }
> 
> I'm not sure I fully follow. For starters, if this is a VM local database, I
> don't think you'd care about the genid. If it's a remote database, your
> connection would get dropped already at the point when you clone/resume,
> because TCP and your connection state machine will get really confused when
> you suddenly have a different IP address or two consumers of the same stream
> :).
>
> But for the sake of the argument, let's assume you can have a connectionless
> database connection that maintains its own connection uniqueness logic.

Right. E.g. not uncommon with REST APIs. They survive disconnect easily
and use cookies or such.

> That
> database connector would need to understand how to abort the connection (and
> thus the transaction!) when the generation changes.

the point is that instead of all that you discover transaction as
a duplicate and revert it.


> And that's logic you
> would do with the read/write/notify mechanism. So your main loop would check
> for reads on the genid fd and after sending a connection termination, notify
> the overlord that it's safe to use the VM now.
> 
> The OpenSSL case (with mmap) is for libraries that are stateless and can not
> guarantee that they receive a genid notification event timely.
> 
> Since you asked, this is mainly important for the PRNG. Imagine an https
> server. You create a snapshot. You resume from that snapshot. OpenSSL is
> fully initialized with a user space PRNG randomness pool that it considers
> safe to consume. However, that means your first connection after resume will
> be 100% predictable randomness wise.

I wonder whether something similar is possible here. I.e. use the secret
to encrypt stuff but check the gen ID before actually sending data.
If it changed re-encrypt. Hmm?

> 
> The mmap mechanism allows the PRNG to reseed after a genid change. Because
> we don't have an event mechanism for this code path, that can happen minutes
> after the resume. But that's ok, we "just" have to ensure that nobody is
> consuming secret data at the point of the snapshot.


Something I am still not clear on is whether it's really important to
skip the system call here. If not I think it's prudent to just stick
to read for now, I think there's a slightly lower chance that
it will get misused. mmap which gives you a laggy gen id value
really seems like it would be hard to use correctly.


> > 
> > 
> > 
> > 
> > 
> > 
> > > +Simplifyng assumption - safety prerequisite
> > > +-------------------------------------------
> > > +
> > > +**Control the snapshot flow**, disallow snapshots coming at arbitrary
> > > +moments in the workload lifetime.
> > > +
> > > +Use a system-level overseer entity that quiesces the system before
> > > +snapshot, and post-snapshot-resume oversees that software components
> > > +have readjusted to new environment, to the new generation. Only after,
> > > +will the overseer un-quiesce the system and allow active workloads.
> > > +
> > > +Software components can choose whether they want to be tracked and
> > > +waited on by the overseer by using the ``SYSGENID_SET_WATCHER_TRACKING``
> > > +IOCTL.
> > > +
> > > +The sysgenid framework standardizes the API for system software to
> > > +find out about needing to readjust and at the same time provides a
> > > +mechanism for the overseer entity to wait for everyone to be done, the
> > > +system to have readjusted, so it can un-quiesce.
> > > +
> > > +Example snapshot-safe workflow
> > > +------------------------------
> > > +
> > > +1) Before taking a snapshot, quiesce the VM/container/system. Exactly
> > > +   how this is achieved is very workload-specific, but the general
> > > +   description is to get all software to an expected state where their
> > > +   event loops dry up and they are effectively quiesced.
> > 
> > If you have ability to do this by communicating with
> > all processes e.g. through a unix domain socket,
> > why do you need the rest of the stuff in the kernel?
> > Quescing is a harder problem than waking up.
> 
> That depends. Think of a typical VM workload. Let's take the web server
> example again. You can preboot the full VM and snapshot it as is. As long as
> you don't allow any incoming connections, you can guarantee that the system
> is "quiesced" well enough for the snapshot.

Well you can use a firewall or such to block incoming packets,
but I am not at all sure that means e.g. all socket buffers
are empty.


> This is really what this bullet point is about. The point is that you're not
> consuming randomness you can't reseed asynchronously (see the above OpenSSL
> PRNG example).
> 
> 
> Alex
> 
> 
> 
> Amazon Development Center Germany GmbH
> Krausenstr. 38
> 10117 Berlin
> Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
> Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
> Sitz: Berlin
> Ust-ID: DE 289 237 879
> 
> 

