Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7657B4A5225
	for <lists+linux-doc@lfdr.de>; Mon, 31 Jan 2022 23:14:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231578AbiAaWO1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 31 Jan 2022 17:14:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231733AbiAaWO1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 Jan 2022 17:14:27 -0500
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E4BC06173B
        for <linux-doc@vger.kernel.org>; Mon, 31 Jan 2022 14:14:26 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id o10so12739065ilh.0
        for <linux-doc@vger.kernel.org>; Mon, 31 Jan 2022 14:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=odVN5zr5EM78SbEFrOlCqjhjAfIyP/M1WivpRxjpnJM=;
        b=VZivi5qfDr/2lgNx22v+J+rv+wtYxONIcECOJBj86BBBy/khDySjEKLFIYTLB17WrY
         ZvUZMA56rH4HF9t6IcoTRi+raBRozCNqC0EV+tq4h3CHYGzcXVdyNxkzfEQmpnAOTA0a
         PQ25vMNXxJ2JMNDc+boSfXtD3l3eN2uAe99z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=odVN5zr5EM78SbEFrOlCqjhjAfIyP/M1WivpRxjpnJM=;
        b=Pq1npx65NSzSnio1XTzYjd/N3U7n7CddYybQzGmvaUlFHEQZD4RtdiWrUn0JrToyRa
         RPyFUUdGaPJ+PdiT/oDka9KnpGmQMD0z6ZXrgMVNZlIZJ8jy5dyo7HpWBq7ts8xSyFdL
         QEi0UiafnAscq4TrWcCzuCuV4gie0ULP0Yy1ju8L+yGyj2gT7colB13yxBxoMaDDkBRl
         AlkbtOxcUviEw+8yNUkQkmasLpl24NAJ+uvpldwhP2i/YNXM10nMQ8Tp1Z13O7zB+Trh
         0fnxELYMi/1jz86J4C/KU+8My2nMFdZBNAkhnzD9cGJqL6xeWdPLl+xTzrX9zne9xT9v
         whJg==
X-Gm-Message-State: AOAM533Yp7y/fjcTFnZcTxIc7PnZdLX0mVJnLgPN0wVie6G2Kif9Vwm8
        Kjv4rgs8QJsWt7JDzd3dGpQ+pA==
X-Google-Smtp-Source: ABdhPJx98f8ah61PCDON2+6eeiNa/KDxDutSrePIxB9D7p5Zhwqfh4MJcIYrLHeeo21AUoJUqeVIyw==
X-Received: by 2002:a05:6e02:1648:: with SMTP id v8mr13914266ilu.282.1643667265810;
        Mon, 31 Jan 2022 14:14:25 -0800 (PST)
Received: from [192.168.1.128] ([71.205.29.0])
        by smtp.gmail.com with ESMTPSA id 8sm19624045ilq.14.2022.01.31.14.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jan 2022 14:14:25 -0800 (PST)
Subject: Re: [PATCH] docs: add rtla documentation kernel docs index
To:     corbet@lwn.net, rostedt@goodmis.org, bristot@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220131201149.446609-1-skhan@linuxfoundation.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <eefff224-e3c0-5113-d238-7b046ccac652@linuxfoundation.org>
Date:   Mon, 31 Jan 2022 15:14:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220131201149.446609-1-skhan@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 1/31/22 1:11 PM, Shuah Khan wrote:
> Link rtla documentation to kernel docs. This patch adds index files under
> tools and rtla directories linking them to the kernel docs index.
> 
> This patch doesn't make any changes to the rtla Makefile and rtla files,
> hence no changes to rtla doc build and install.
> 
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> ---
>   Documentation/index.rst            | 10 ++++++++++
>   Documentation/tools/index.rst      | 17 +++++++++++++++++
>   Documentation/tools/rtla/index.rst | 19 +++++++++++++++++++
>   3 files changed, 46 insertions(+)
>   create mode 100644 Documentation/tools/index.rst
>   create mode 100644 Documentation/tools/rtla/index.rst
> 

Ignore this one as well. rc2 has the hook.

commit 941518d6538afa5ea0edc26e6c009d0b3163d422
Author: Jonathan Corbet <corbet@lwn.net>
Date:   Thu Jan 20 17:00:33 2022 -0700

     docs: Hook the RTLA documents into the kernel docs build

thanks,
-- Shuah

