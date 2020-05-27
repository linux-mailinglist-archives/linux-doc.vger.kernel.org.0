Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E41A1E4FCE
	for <lists+linux-doc@lfdr.de>; Wed, 27 May 2020 23:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728563AbgE0VIB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 27 May 2020 17:08:01 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34235 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728481AbgE0VIA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 May 2020 17:08:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590613679;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3sSNRFYrb0CdmbwXzPVaN6Wl+qrkOkjvYM/9vtvRcHo=;
        b=Eu4IoVjsrhT3li/XvMZj7RRjOdwTvNumFAFfw+ppIjxEZIqdDG7vqhTTN1M/yJOf2Lh+8p
        nOQqFyiu5wz5kIclZaQn6+gWqr/WJPZ+yIeY8fUN3f7BCJhd2AxPfV8pQOBl7q1sUDViHM
        FtcA7G05xHY0kLkbKUzqYmjD3WYvHjY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-dcdyQ3Q1PraeKp7T8CS6xg-1; Wed, 27 May 2020 17:07:57 -0400
X-MC-Unique: dcdyQ3Q1PraeKp7T8CS6xg-1
Received: by mail-wr1-f71.google.com with SMTP id d6so7559820wrn.1
        for <linux-doc@vger.kernel.org>; Wed, 27 May 2020 14:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3sSNRFYrb0CdmbwXzPVaN6Wl+qrkOkjvYM/9vtvRcHo=;
        b=RJ+y4x2f7Enh4D03AyazQwrf8bs/P9C/D/pYI94fHwtDkorWuagYCdEGvU+FKUD4dQ
         /hSGO0v8RrlpFqwjGLqSbud3xdtcOgxkGrkZbykcoAdaIRpbqL027loNlYDwaCpj5er+
         vN05DPG/eWOeLnOP+YELrrJOW9bYlUNBNdAx4ykYjaZb4hNLp/yFFsZ3L3foO6j0Ustv
         TvGk6jlljvzeNe6oouuTR2BURDtx475oHr3nQA8ifG5KJA8Qd9qjyAhtaMhvJex3SXtc
         9xCSmbPzaYjGWanaOi3h/LrR4s62W30eqKOOd4U0TAYO1HD5khLCVMhjE0Z7GzsGydLq
         3XsA==
X-Gm-Message-State: AOAM531m/kD/ohlaiNGFtGiYvNWY5ttKQqkvfhG30PhDeFHJjPXaU2bd
        uPW8ui9wrRh+J4Lkk9gZP3PGbxRoWNWo2tzpPbkm2TK7OYC+Vyz51nsxz7/Ex3iIcdzWSaOIZqr
        CxLptLv6dO1kFo62cQZLy
X-Received: by 2002:adf:e908:: with SMTP id f8mr195575wrm.184.1590613676652;
        Wed, 27 May 2020 14:07:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/MqK9aixnJqSNydmC9tSwCyqyq7nI9EAoQtkXsEPNQuE8I0JoA6xnM6f4HETfKsks8bq+5g==
X-Received: by 2002:adf:e908:: with SMTP id f8mr195551wrm.184.1590613676318;
        Wed, 27 May 2020 14:07:56 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:3c1c:ffba:c624:29b8? ([2001:b07:6468:f312:3c1c:ffba:c624:29b8])
        by smtp.gmail.com with ESMTPSA id v27sm4074887wrv.81.2020.05.27.14.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2020 14:07:55 -0700 (PDT)
Subject: Re: [PATCH v3 0/7] Statsfs: a new ram-based file system for Linux
 kernel statistics
To:     Jakub Kicinski <kuba@kernel.org>,
        Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc:     kvm@vger.kernel.org,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Jim Mattson <jmattson@google.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
        David Rientjes <rientjes@google.com>,
        Jonathan Adams <jwadams@google.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, kvm-ppc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org,
        Andrew Lunn <andrew@lunn.ch>
References: <20200526110318.69006-1-eesposit@redhat.com>
 <20200526153128.448bfb43@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
 <6a754b40-b148-867d-071d-8f31c5c0d172@redhat.com>
 <20200527132321.54bcdf04@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <af2ba926-73bc-26c3-7ce7-bd45f657fd85@redhat.com>
Date:   Wed, 27 May 2020 23:07:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200527132321.54bcdf04@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 27/05/20 22:23, Jakub Kicinski wrote:
> On Wed, 27 May 2020 15:14:41 +0200 Emanuele Giuseppe Esposito wrote:
>> Regarding the config, as I said the idea is to gather multiple 
>> subsystems' statistics, therefore there wouldn't be a single 
>> configuration method like in netlink.
>> For example in kvm there are file descriptors for configuration, and 
>> creating them requires no privilege, contrary to the network interfaces.
>
> Enumerating networking interfaces, addresses, and almost all of the
> configuration requires no extra privilege. In fact I'd hope that
> whatever daemon collects network stats doesn't run as root :)
> 
> I think enumerating objects is of primary importance, and statistics 
> of those objects are subordinate.

I see what you meant now.  statsfs can also be used to enumerate objects
if one is so inclined (with the prototype in patch 7, for example, each
network interface becomes a directory).

> Again, I have little KVM knowledge, but BPF also uses a fd-based API,
> and carries stats over the same syscall interface.

Can BPF stats (for BPF scripts created by whatever process is running in
the system) be collected by an external daemon that does not have access
to the file descriptor?  For KVM it's of secondary importance to gather
stats in the program; it can be nice to have and we are thinking of a
way to export the stats over the fd-based API, but it's less useful than
system-wide monitoring.  Perhaps this is a difference between the two.

Another case where stats and configuration are separate is CPUs, where
CPU enumeration is done in sysfs but statistics are exposed in various
procfs files such as /proc/interrupts and /proc/stats.

Thanks,

Paolo

