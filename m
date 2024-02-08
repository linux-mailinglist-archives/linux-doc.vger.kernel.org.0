Return-Path: <linux-doc+bounces-8652-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4B684DCEB
	for <lists+linux-doc@lfdr.de>; Thu,  8 Feb 2024 10:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB39A1C2675F
	for <lists+linux-doc@lfdr.de>; Thu,  8 Feb 2024 09:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578C96E2DE;
	Thu,  8 Feb 2024 09:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="nTxFGSMg"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B6A6E2D2
	for <linux-doc@vger.kernel.org>; Thu,  8 Feb 2024 09:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707384399; cv=none; b=RGSwdynWQh8KTeNtmCLcyME2073K9RPiAa4lQqfH8LyF3Ck18jysi7eZ3D6889Z7tAJu39xBe+JeogmRcpB9ojdV0w/kPzqxaqTjoKo7olanPzDI2esNO8wnixyduMi+uWDcbZiuzFE47YIr+PlxL1gRNHO4MbrGJ4MuRbWgCGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707384399; c=relaxed/simple;
	bh=UWeQJCER8zXhqPwH0OuvxMry3m1VwMFBmLt7F6/2HpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n/ZB3rIJvm3JuVuipaEJoCKxnaI09yGAJXO5koP9uhAqgtiGZk23Vy20XK1uIll+pZ9SaN7NqNmXnN0nzrog0T1tcIMPK7GqFStuZMaU881Blt94Om7oC+lZpGPsIplKVk5n1Ky7ru/Wgo9zbtSGOfJTItm4PMG3PuKfaTHTsNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org; spf=pass smtp.mailfrom=joelfernandes.org; dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b=nTxFGSMg; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-68c431c6c91so6287156d6.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Feb 2024 01:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1707384396; x=1707989196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VQR/FZR/rxXp/GDaSedW04oA7HUPwpCfLl/D3NpRt64=;
        b=nTxFGSMgFTXXk+jHeqf7uY4CjELRNnaJBy+Di+APkIOOtisSsE5DeIeu2NAsF56yXl
         5MqC9edFM+FbBobmIazEdbiGHFkO+U/L1wHDavaXmaMtYtBfxQ4vm8g+vmUdEHIonIBB
         3M8m1ZWS8Fa4N1oChYcgE6rGtGvhySg6Zl02s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707384396; x=1707989196;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VQR/FZR/rxXp/GDaSedW04oA7HUPwpCfLl/D3NpRt64=;
        b=aT+PXNG1CdYePhDxiLfj7D8XaZvSmMobT1MQi3wD7eO+BGMmZFSyyhz/2Uo30SZ3WH
         Ww5zBDDQHTw9sHHFyqAw3cMtUEOHAWQEyuMRyqN2RI42Zem6hAeV4v3ZdonlPjTeAFTV
         KMwZV3fBE/jQFEoJxUVk8rCGZAvtjVE6GQQqXnbNQqAv73B3WccqFj3BkamlmyaCsIGk
         dkcGSnusPOZZz8bhGEa46ADygjUWEUMYwmWIvNUrUyMM6dABVxyt+TJvcOKO+sZD8NEv
         O50CHyCCweOrXK1eIEAfP5BEQlk7qDKTYSd6mh20jNpDfkJsuaNNTwq1JNN6yfKzfjxU
         hBmA==
X-Gm-Message-State: AOJu0Yy15LcAf1zSjHpNlnjB0xg9UACcK3V/77OlV3wxDnCHzaeIOY9l
	bptjd5v2tkjkVkBcWskzpCAc37qns3Hla3AIXuoakI0bBtyZbg8vw3FjkFTn2aD1tLk5HMGOtM1
	S
X-Google-Smtp-Source: AGHT+IFyQqY/XMxLBi2+dW1HrhIyrQBgWWK6z36X0AV/vyVfmePVfHf89Cci4NiwIgBgMn8BTIQSjA==
X-Received: by 2002:ad4:596a:0:b0:68c:87ed:ef36 with SMTP id eq10-20020ad4596a000000b0068c87edef36mr8957401qvb.29.1707384396330;
        Thu, 08 Feb 2024 01:26:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWGEJIadMuHTt7Jw2f7HfK54uZfZvBAKdjJMHuqaJU+VzV0d0j4E0vrLDjLQwxeTE4zgd9d4LJqCxQ34ZSxxQDEMRMgwVAwPoUk2+BA9Y55cZ//dagNPc6ssASYAs5wRizJ1vGyZ5AgUbvFTzAzWaqIROCdt2PazC9Hyozi7/iVjw9nFGIbVC2b77pjYwNZyFGVIvIAonO+F3cpbMHS5wV0BTupRfrjQLpLst5Z4g0VcJyHhcJMia/WbhSqhH9AUHk879BylgJABR4eQCY8BkXqfGplm4yjxnBcb55ojyK1LoIHpCZOt8Tl2QaeKUy9cduhfR+be/8xU/yF0OgbssQjtxpW9wmI+yzcK4Bdm4vidAOMmvbYgWzYQjI1JrPe14rNtS0ZjCETxZrmxPv4p9Y6jJZyufAfZEyTg1460vrjJ9aqIOf6fFhjluO5ols3ys8pyZTgSUtSoDYyaB6FIkC16bfZDQ4nniMnywP/IGxRgKFUqLZE23LALf/Dq4MRuKg6b0ztq1iBSq8xTow8yKRNAoXQIOV5/cEAewsF66hZHnh52TYx7U09gRJrdGm8kptD4Kae03uBgxSXspUaDxHEPyGKUQ/PV66GlLEBc/rXQVyVg2o=
Received: from [192.168.0.226] (c-98-249-43-138.hsd1.va.comcast.net. [98.249.43.138])
        by smtp.gmail.com with ESMTPSA id ph30-20020a0562144a5e00b0068c6dd9af10sm1407729qvb.64.2024.02.08.01.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 01:26:35 -0800 (PST)
Message-ID: <497fdb48-9fce-444e-8d51-2073a37f697d@joelfernandes.org>
Date: Thu, 8 Feb 2024 04:26:30 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] tracing: Support to dump instance traces by
 ftrace_dump_on_oops
Content-Language: en-US
To: Huang Yiwei <quic_hyiwei@quicinc.com>,
 Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mark.rutland@arm.com, mcgrof@kernel.org,
 keescook@chromium.org, j.granados@samsung.com,
 mathieu.desnoyers@efficios.com, corbet@lwn.net,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 quic_bjorande@quicinc.com, quic_tsoni@quicinc.com, quic_satyap@quicinc.com,
 quic_aiquny@quicinc.com, kernel@quicinc.com,
 Ross Zwisler <zwisler@google.com>
References: <20240206094650.1696566-1-quic_hyiwei@quicinc.com>
 <50cdbe95-c14c-49db-86aa-458e87ae9513@joelfernandes.org>
 <20240207061429.3e29afc8@rorschach.local.home>
 <CAEXW_YSUD-CW_=BHbfrfPZAfRUtk_hys5r06uJP2TJJeYJb-1g@mail.gmail.com>
 <ec99fdee-8d3f-476f-842f-f57b2b817dae@quicinc.com>
From: Joel Fernandes <joel@joelfernandes.org>
In-Reply-To: <ec99fdee-8d3f-476f-842f-f57b2b817dae@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/8/2024 4:22 AM, Huang Yiwei wrote:
> 
> 
> On 2/7/2024 10:13 PM, Joel Fernandes wrote:
[..]
>>> Perhaps we need an option for these too, and have all options be
>>> updated via the command line. That way we don't need to make special
>>> boot line parameters for this. If we move these to options (keeping the
>>> proc interface for backward compatibility) it would make most features
>>> available to all with one change.
> It's a good idea that "traceoff_on_warning" also has instance support, but we
> will use another patchset to do this, right?
> 
> And for this patchset, shall I fix the typo and resend again? Thanks.

That is fine with me but it is up to tracing maintainers. ;-)

 - Joel



