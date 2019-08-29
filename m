Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A942A1443
	for <lists+linux-doc@lfdr.de>; Thu, 29 Aug 2019 11:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbfH2JBC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 29 Aug 2019 05:01:02 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45204 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbfH2JBC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 05:01:02 -0400
Received: by mail-lf1-f68.google.com with SMTP id r134so1003607lff.12
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 02:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GflFtIVZM88+m/b3O03bHRfVUBRCQA10rQsteTPRKU0=;
        b=RP9ClfqOBQdl68pRWDcY1JCCs1Q5wuSwXqTQrxZa5L9iq2jlLy/LK7xGMohK9vjwrI
         8QanvCJNGjB66AKh+egkfLNnsxAPiDwz0oIhnJxN/4upQRp6I9mgP6GbkpjEaklkyWNo
         f5ODkjYbir1wzaER7e4PsqFQ0LVLKue9Tx9J4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GflFtIVZM88+m/b3O03bHRfVUBRCQA10rQsteTPRKU0=;
        b=IIJqh4hJvA2ZlPnn54P2GKrNbvzY7HIvhHy1qi3yr1lZdTNmurBKrjeUKRp5jK9wbU
         1HjdnLlIcbW2OsEO5HBZrv81I/8Vl3b2vnceSAX/zgsbt7Dx+4Xb6braqaNCEgVp0TYR
         PT+FoFdug6h6bc2yZRMkdgv2sBBCHHQl66bdxgcQZ2F8yU0Kvd14IZVoBG0z9IamOlea
         01rG7xcZWgn7p4wum37jQPiTK9RLvj3c2IH+y2kcnBsuCtXQQKI6rRO6SNAFg5p+7dda
         lvao1ymnC7UDDD0QQAbnqgSWoqbOqXxItp5u86kQppqC7C207c+zSIT4cNhvqPdbeedB
         Fysw==
X-Gm-Message-State: APjAAAXangkkKVS95xiNWMYmpS3Ld7fuvU1B98mSP2uKXgB/eNlRvU0s
        6u5cwJWSOTxL9xyXFrGJUMYT/Q==
X-Google-Smtp-Source: APXvYqwjN+5W4ntXA7MNnNHNpk1WEY6DjWz1C1dmXfCEJi7QBlRTnI4JIU6BGp373PYAFgm2lm4kVw==
X-Received: by 2002:a19:6d17:: with SMTP id i23mr5440814lfc.44.1567069260255;
        Thu, 29 Aug 2019 02:01:00 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id l11sm293261lfh.48.2019.08.29.02.00.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Aug 2019 02:00:59 -0700 (PDT)
Subject: Re: [PATCH v2] vsprintf: introduce %dE for error constants
To:     Petr Mladek <pmladek@suse.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
Cc:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        metux IT consult Enrico Weigelt <lkml@metux.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190827211244.7210-1-uwe@kleine-koenig.org>
 <20190828113216.p2yiha4xyupkbcbs@pathway.suse.cz>
 <74303921-aa95-9962-2254-27e556af54f4@kleine-koenig.org>
 <20190829081249.3zvvsa4ggb5pfozl@pathway.suse.cz>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <39eda8f7-8c39-f899-075f-b4abdefe0098@rasmusvillemoes.dk>
Date:   Thu, 29 Aug 2019 11:00:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829081249.3zvvsa4ggb5pfozl@pathway.suse.cz>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 29/08/2019 10.12, Petr Mladek wrote:
> On Wed 2019-08-28 21:18:37, Uwe Kleine-K�nig  wrote:

> BTW: I though more about generating or cut&pasting the arrary.
> I can't find any reasonable way how to generate it.

Something like this seems to work, though it probably needs some massage
to be accepted by kbuild folks:

define filechk_errcode.h
	echo '#include <linux/errno.h>' | \
	$(CPP) $(NOSTDINC_FLAGS) $(LINUXINCLUDE) -dM - | \
	grep 'define E' | sort -k3,3n | \
	awk '{print "errcode("$$2")\t/* "$$3" */"}'
endef

include/generated/errcode.h: FORCE
	$(call filechk,errcode.h)

Then one can just #define errcode(foo) ... right before #include
<generated/errcode.h>. It cannot be used to generate cases in a switch()
because some expand to the same number, but that's ok, because I can't
imagine the switch actually generating good or small code. I haven't
checked how or whether it works in a cross-compile situation.

Rasmus
