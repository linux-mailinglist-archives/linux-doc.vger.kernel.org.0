Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF961C47A
	for <lists+linux-doc@lfdr.de>; Tue, 14 May 2019 10:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbfENIMb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 14 May 2019 04:12:31 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35547 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbfENIMb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 May 2019 04:12:31 -0400
Received: by mail-pl1-f195.google.com with SMTP id g5so7872055plt.2
        for <linux-doc@vger.kernel.org>; Tue, 14 May 2019 01:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NVJCQ/meS0Lsexv3IBx7F9d7yUIfFyO6avMbOIjFh4s=;
        b=Qf/S0L0GOg+nfU17642TqGkQqhXSonrx9ER/aBydfh/biW25VannRP2+rJFupFnjNQ
         6O3jNdfrZjij+GeMIqitmfstQ1mnbWWM05ksAzIPhV2I5nUim0wwLfODJnqnUNud35CU
         dbKTV24y+A9OvRbYlzMzJKLZHVKLHAMmsK1K7rVw6Co+mNGh5+PF42t5apYIhH35lC7k
         TgKcpWx2X2H+uW5hCymmqwV2gfLLNQvl8xN1+zUkXShWD4K7KWjS5GQDAMIh63fYGXm+
         ed3BAsVtwYpPvqJsF7boIU5AB93ewkgqizm7aT4FDCBxNcM20DD8HvqPNk6s6Afw8A0a
         krHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NVJCQ/meS0Lsexv3IBx7F9d7yUIfFyO6avMbOIjFh4s=;
        b=mFDPPoh3PqqE+YSkXoXffcnTj83TZmoO/MLnugRD7CK2WWHMwkzp0/A+iMwPNyRxSI
         Dr6BXYU8I+0XtHMbKCKM3Hl9JbYkWxwjFjL+6YUAwWT6KMFZRDFkFayuVCqhpvXz2u/H
         7dVNRTu8WOdj5f9Z3KRBKkUHo+KUJNZJd11Fe9m7ihpGSrdkM3C6EL1yNf06dKvbbhWU
         S1JEUYk3TZLRt8A3vtMb2gLy4doGr6MZyBOppkpprYXmDjywd1ae7K3824HwdZGo9xQf
         rfZqmIt/N/aVZ8sZKCnIUUnpXBwgIUdyQ/1QTjwgVWMomYYcXzQvU4we4UAsCwpHg2du
         +BRg==
X-Gm-Message-State: APjAAAUhaZSGPpqmPbKAfABofM/bzO/A41iht/H0h575ci68bIkdsEpB
        BxgGxAR1Bqo0vHcOoElCfS8SgA==
X-Google-Smtp-Source: APXvYqxsZM0ICZqWX68w0XRe09cnfhLQe5GD234bzH2jX1Q7W6s2mg37aevN5UE3Oi+D1MLUU05rWw==
X-Received: by 2002:a17:902:e9:: with SMTP id a96mr9816444pla.37.1557821549846;
        Tue, 14 May 2019 01:12:29 -0700 (PDT)
Received: from google.com ([2620:15c:2cd:2:d714:29b4:a56b:b23b])
        by smtp.gmail.com with ESMTPSA id v1sm23451654pgb.85.2019.05.14.01.12.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 14 May 2019 01:12:28 -0700 (PDT)
Date:   Tue, 14 May 2019 01:12:23 -0700
From:   Brendan Higgins <brendanhiggins@google.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     frowand.list@gmail.com, gregkh@linuxfoundation.org,
        keescook@google.com, kieran.bingham@ideasonboard.com,
        mcgrof@kernel.org, robh@kernel.org, sboyd@kernel.org,
        shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
        Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
        amir73il@gmail.com, dan.carpenter@oracle.com,
        dan.j.williams@intel.com, daniel@ffwll.ch, jdike@addtoit.com,
        joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com,
        knut.omang@oracle.com, logang@deltatee.com, mpe@ellerman.id.au,
        pmladek@suse.com, rdunlap@infradead.org, richard@nod.at,
        rientjes@google.com, rostedt@goodmis.org, wfg@linux.intel.com,
        kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v3 08/18] objtool: add kunit_try_catch_throw to the
 noreturn list
Message-ID: <20190514081223.GA230665@google.com>
References: <20190514054251.186196-1-brendanhiggins@google.com>
 <20190514054251.186196-9-brendanhiggins@google.com>
 <20190514065643.GC2589@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514065643.GC2589@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 14, 2019 at 08:56:43AM +0200, Peter Zijlstra wrote:
> On Mon, May 13, 2019 at 10:42:42PM -0700, Brendan Higgins wrote:
> > This fixes the following warning seen on GCC 7.3:
> >   kunit/test-test.o: warning: objtool: kunit_test_unsuccessful_try() falls through to next function kunit_test_catch()
> > 
> 
> What is that file and function; no kernel tree near me seems to have
> that.

Oh, sorry about that. The function is added in the following patch,
"[PATCH v3 09/18] kunit: test: add support for test abort"[1].

My apologies if this patch is supposed to come after it in sequence, but
I assumed it should come before otherwise objtool would complain about
the symbol when it is introduced.

Thanks!

[1] https://lkml.org/lkml/2019/5/14/44
