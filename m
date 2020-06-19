Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5CFE201CB9
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2020 22:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390692AbgFSUtc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 19 Jun 2020 16:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388039AbgFSUtb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Jun 2020 16:49:31 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48C20C0613EF
        for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2020 13:49:31 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id h95so4780627pje.4
        for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2020 13:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rLyQA4HeIFPze9HGaS5SxnYGakT1PSoKWlcAChVE7E8=;
        b=xVzTl56icH9Uvk8UfA6wAEnzMaKsw/Ooar1PhxwMHobXdlBS0MA7GOxtJRUpcUmxN3
         Feu4oBC2FQFGtmkf+bo09lKQ7ZNbf0b9kwN6zFxEzdNo3YoMnGH8P4LJZOYMSuZzCtlW
         tXbz6dw95Ebx9GC9oS5rITMEctobVHfn/o6aYg4XlkyXYHX39+cF4fs0k3NFvuj19NT6
         6GhVQ+jVTybFucSMX2sIBtdD6ri2nElZ83Zo4nS7rspirPY4NbfVRAtt3Iqi2xOf8AxP
         5YRnE7PDfY/ZyxZMW5L2dqs2qKgXO8MLp4itFikKcU9vhvaRQewHSWqticBGFsgoUJSo
         hR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rLyQA4HeIFPze9HGaS5SxnYGakT1PSoKWlcAChVE7E8=;
        b=VDeNIQziGM0zf4Nn+21h8Bk3lxtLcNxu5MwDDkgl3HDLXTPQAaDGOdPpVOAzqZkIYr
         W4OKa4rUVvr2GSQE8DQyX7OieO3tiNpRfmcDkj2wYcY3/3Tvpb6nNB3tH9Mn4sF9583F
         evMzlXcNIPD6xO2lSn5uDI72mYKKCW2MYqPpC+j8TtL8HFN4dTdw/1MtppCEuuhBAvC6
         n6qgHa9dR5a/fRfTvqpEms5MQv8dqWfxevjrnoiGShSJXfJMf+mmnWW2tXuKH/tQtJRH
         HM433P8YaDkY/ALqPx7eiG9JpgMyyVpSj32tVMeGYODPop80vXk4T18rglnT8wZvb+S+
         j0Qw==
X-Gm-Message-State: AOAM532sFwlxdcIawBk0a+NsrETonbu6265GMOYmhUp0zBaVXL6j/IG7
        Iec888H4kdHYrKY5eEVI40BGpA==
X-Google-Smtp-Source: ABdhPJzIEuXnm41yY6Ne2AKlhZott/KmuS1PhAy+uUmDvAVUu5EnJ6I49xIDXbyRG36Jq02ok3x5jw==
X-Received: by 2002:a17:902:9f90:: with SMTP id g16mr9841686plq.146.1592599770302;
        Fri, 19 Jun 2020 13:49:30 -0700 (PDT)
Received: from ?IPv6:2620:10d:c085:21c1::1762? ([2620:10d:c090:400::5:a8e1])
        by smtp.gmail.com with ESMTPSA id h9sm6789457pfe.32.2020.06.19.13.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2020 13:49:29 -0700 (PDT)
Subject: Re: [PATCH v2] docs: block: Create blk-mq documentation
To:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
Cc:     linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        krisman@collabora.com
References: <20200605175536.19681-1-andrealmeid@collabora.com>
 <20200619134503.60ab689b@lwn.net>
 <cdab3be8-0d39-5085-34b5-7bf11cc7fb60@infradead.org>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <a9b6447f-1b24-5f71-3661-c6ea5fe8ba6e@kernel.dk>
Date:   Fri, 19 Jun 2020 14:49:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <cdab3be8-0d39-5085-34b5-7bf11cc7fb60@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/19/20 1:47 PM, Randy Dunlap wrote:
> On 6/19/20 12:45 PM, Jonathan Corbet wrote:
>> On Fri,  5 Jun 2020 14:55:36 -0300
>> André Almeida <andrealmeid@collabora.com> wrote:
>>
>>> Create a documentation providing a background and explanation around the
>>> operation of the Multi-Queue Block IO Queueing Mechanism (blk-mq).
>>>
>>> The reference for writing this documentation was the source code and
>>> "Linux Block IO: Introducing Multi-queue SSD Access on Multi-core
>>> Systems", by Axboe et al.
>>>
>>> Signed-off-by: André Almeida <andrealmeid@collabora.com>
>>> ---
>>> Changes from v1:
>>> - Fixed typos
>>> - Reworked blk_mq_hw_ctx
>>
>> Jens, what's your pleasure on this one?  Should I take it, or do you want
>> it...?
> 
> I wouldn't mind seeing a v3.

Agree - Jon, I'd be happy with you taking it once a v3 is posted with the
remaining issues ironed out.

-- 
Jens Axboe

