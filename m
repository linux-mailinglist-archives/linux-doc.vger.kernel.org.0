Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE3B103102
	for <lists+linux-doc@lfdr.de>; Wed, 20 Nov 2019 02:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727226AbfKTBOc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Nov 2019 20:14:32 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39114 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727334AbfKTBOc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Nov 2019 20:14:32 -0500
Received: by mail-pg1-f196.google.com with SMTP id b126so1083377pga.6
        for <linux-doc@vger.kernel.org>; Tue, 19 Nov 2019 17:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XNg1tjP9INvmM/DeIAYa5hYUQZyQDSSg86vYo3TV7Ho=;
        b=dCsxQGhHkmzl0ml2pIeI752b4HtkmyA3ByI5TXA2lfq2sPe5YuX64IxdaxlSeJvBuV
         kJ6EnIRwzhwSfJvpkLNQRsmmQE2fm9FqizwJ4xHIjocMniRI3cXYKdwtD+bRfX5HTGYs
         De6B8bN45rbuhaRT3sau60ZO+OLcv8t39NXwOOw7DAA4V6iW7QcASdhZfpoSqqOlK+dT
         3eintlSrtwCHFK81GtH2KY50K6dzw0ZmyjuwdjBfCd0Ha4e0+WR7BvQcFRY7Te+Qx1XJ
         c1IVDQ5xqvETFTC7+BwVQ68dETVNW/DhzUKHCGLD+tnMkTTd74yNJt35d1tZr6sLaA3w
         Zoyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XNg1tjP9INvmM/DeIAYa5hYUQZyQDSSg86vYo3TV7Ho=;
        b=LvZqHju4H0Nu3ccNhFNivc/lTN1ChMgxXwLOzQ4J5rAtRbnpzZm3T/HWJbd/UmC54h
         GQslModiPsVfb1zConZ9VV4GQ87nyX/kUnTWlqL8oiQt0ZFDVMjHb5n/eGxT8VtlChbF
         hbVVehWfibPJkQzQ0/yje/M/SjRxMDRxWpPJwR9qxcrWzzTdrDjtk57Oapq6pY21prR4
         7NvpvCCWk8KQqqyjShbiX6Lq+H0v42g+KFbmk2LplHyzfN/c6rwSFacLheCM+ECUO+Tu
         g04b/bsPQVD/WQEg3qNpTSIoLh7uR/HtyT4phfBUyVc5/dojEcGs4GDNx86iYbwyINJG
         RMXw==
X-Gm-Message-State: APjAAAVRwVKKBtROLqcVnY3ujFj0R1JrEnFvaoNXu4F4v3FOc8lCmX3y
        izXU5nuv4kYlT0ts02yivqN9qR4H2FaRiVLFzn7waQ==
X-Google-Smtp-Source: APXvYqxAkXh/yc2VcsZRwT1JGfFXlfbvmuoJtajYbRBOUk8rZUaOu5y1Dveu5HQDIG/KqwFiiTzNCFJIVyw3PhzaCGs=
X-Received: by 2002:a63:5163:: with SMTP id r35mr96501pgl.201.1574212471139;
 Tue, 19 Nov 2019 17:14:31 -0800 (PST)
MIME-Version: 1.0
References: <20191119003120.154041-1-brendanhiggins@google.com> <4a3aada5-fe8f-9c82-dfd4-0494acf59334@infradead.org>
In-Reply-To: <4a3aada5-fe8f-9c82-dfd4-0494acf59334@infradead.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 19 Nov 2019 17:14:20 -0800
Message-ID: <CAFd5g47+3TN4pOdeM0YmJpMP2uKnpJYUY_OXmqmZEn8OcVz6ow@mail.gmail.com>
Subject: Re: [PATCH linux-kselftest/test v3] Documentation: kunit: add
 documentation for kunit_tool
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     shuah <shuah@kernel.org>, David Gow <davidgow@google.com>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "Theodore Ts'o" <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 19, 2019 at 4:27 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 11/18/19 4:31 PM, Brendan Higgins wrote:
> > +How do I use kunit_tool?
> > +=================================
>
> Hi,
> I haven't tested this, but Sphinx (or some doc tool) usually complains if the
> underline length is not the same as the header text length.  (I.e., use fewer
> = signs above.)

Hmmm...Sphinx and checkpatch didn't complain. I wonder if it is a
different script, or maybe I have to use a particular option with
Sphinx.

In any case, thanks for catching this!

> > +
> > +If a kunitconfig is present at the root directory, all you have to do is:
> > +
> > +.. code-block:: bash
> > +
> > +     ./tools/testing/kunit/kunit.py run
