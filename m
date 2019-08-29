Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECFCA1469
	for <lists+linux-doc@lfdr.de>; Thu, 29 Aug 2019 11:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727183AbfH2JJu (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 29 Aug 2019 05:09:50 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41505 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbfH2JJu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 05:09:50 -0400
Received: by mail-lj1-f196.google.com with SMTP id m24so2258693ljg.8
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 02:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=489FQGjJLqXDSKSlEr9geJrL+c7/49Z600Juares+AY=;
        b=Z64hx8aYxKDT1yQBt+9mE+5YSVj95qMujrRDTYi50my74gMq0cNlWOYCbUqIeoVFhg
         jZnAb1B6fKq6cOas5/PxOwzDbhOkP+9iNSbocSqG1WsLlEEQPZYGb+YKnKiQ9BLV0l5h
         8/RK1EyRP5i8CEFyG81o0PhyW6p8ZVV9IiUMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=489FQGjJLqXDSKSlEr9geJrL+c7/49Z600Juares+AY=;
        b=L3lVPFxWa5NbF5UPsqbOADSxQoJtFixkmQGgJTZr2fe4i7JObOD9Ga2m/meXqOyTmB
         U7YEW17ggHedI21OnqdvehhewNlQTyQpM/NMdRhF0EspSpBWq/htrYq4qrD2yWvUg5ie
         qorjQcanWRAG7VfJbRejt//zfp1RDES7f0AJR04wDTiA9+qEH4lIQhlCLxk2NsEy6kTa
         B3DGznO3V+4IaNgz1R2FePjUYfoAL7NwTQYwQ58kAAf9LK+OqjYbETFysVVzNqxvvG62
         CZX5WFCDUb2pAH6p4QYc0I6r0j3D/1XyZyLMUwhv8QbPmtifyuH7wCEjG/qDtK0T8Ogy
         UbrA==
X-Gm-Message-State: APjAAAWWV1pFAyuX66l4cVtnK6gD90RZUUt6mtxxHKokhxLNnv06Boww
        qX4RVACVaYBaJEgEdO85GS3XBA==
X-Google-Smtp-Source: APXvYqzV7OlXH2nJCS1ZKsuXiWBHCy7VrQyQdigDb0HhJ8/pdOTlG/NXHxIi8zuyjb8PS/msNi+GIA==
X-Received: by 2002:a2e:3109:: with SMTP id x9mr4525887ljx.19.1567069788536;
        Thu, 29 Aug 2019 02:09:48 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id v20sm261658ljj.47.2019.08.29.02.09.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Aug 2019 02:09:48 -0700 (PDT)
Subject: Re: [PATCH v2] vsprintf: introduce %dE for error constants
To:     Juergen Gross <jgross@suse.com>, Petr Mladek <pmladek@suse.com>,
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
 <45cd5b50-9854-fce7-5f08-f7660abb8691@suse.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <a83449cf-3a4a-f3e0-210a-dc7c39505355@rasmusvillemoes.dk>
Date:   Thu, 29 Aug 2019 11:09:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <45cd5b50-9854-fce7-5f08-f7660abb8691@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 29/08/2019 10.27, Juergen Gross wrote:
> On 29.08.19 10:12, Petr Mladek wrote:
>> On Wed 2019-08-28 21:18:37, Uwe Kleine-König  wrote:
>>>
>>> I'd like to postpone the discussion about "how" until we agreed about
>>> the "if at all".
>>
>> It seems that all people like this feature.
> 
> Hmm, what about already existing format strings conatining "%dE"?
> 
> Yes, I could find only one (drivers/staging/speakup/speakup_bns.c), but
> nevertheless...

Indeed, Uwe still needs to respond to how he wants to handle that. I
still prefer making it %pE, both because it's easier to convert integers
to ERR_PTRs than having to worry about the type of PTR_ERR() being long
and not int, and because alphanumerics after %p have been ignored for a
long time (10 years?) whether or not those characters have been
recognized as a %p extension, so nobody relies on %pE putting an E after
the %p output. It also keeps the non-standard extensions in the same
"namespace", so to speak.

Oh, 'E' is taken, well, make it 'e' then.

Rasmus
