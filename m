Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8CD3276A4F
	for <lists+linux-doc@lfdr.de>; Thu, 24 Sep 2020 09:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbgIXHOa (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 24 Sep 2020 03:14:30 -0400
Received: from mx2.suse.de ([195.135.220.15]:49494 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726929AbgIXHO3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 24 Sep 2020 03:14:29 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 85B86AA55;
        Thu, 24 Sep 2020 07:15:05 +0000 (UTC)
Subject: Re: [PATCH v2 2/3] dma-buf: Use struct dma_buf_map in dma_buf_vmap()
 interfaces
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     christian.koenig@amd.com, airlied@linux.ie,
        dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
        kraxel@redhat.com, tfiga@chromium.org, sam@ravnborg.org,
        m.szyprowski@samsung.com, corbet@lwn.net,
        linux-doc@vger.kernel.org, jonathanh@nvidia.com,
        matthew.auld@intel.com, linux+etnaviv@armlinux.org.uk,
        labbott@redhat.com, linux-media@vger.kernel.org, pawel@osciak.com,
        intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, thomas.hellstrom@intel.com,
        rodrigo.vivi@intel.com, linux-tegra@vger.kernel.org,
        mchehab@kernel.org, lmark@codeaurora.org, afd@ti.com,
        kyungmin.park@samsung.com, robin.murphy@arm.com
References: <20200923123205.30671-1-tzimmermann@suse.de>
 <20200923123205.30671-3-tzimmermann@suse.de>
 <20200923153908.GT438822@phenom.ffwll.local>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <5ebffa27-4479-7487-bbc5-8230c8dbde91@suse.de>
Date:   Thu, 24 Sep 2020 09:14:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200923153908.GT438822@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0PDgmugOtYTKuFhKgfUTndpr73KvkO8XC"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0PDgmugOtYTKuFhKgfUTndpr73KvkO8XC
Content-Type: multipart/mixed; boundary="KIiFM399i8teHRQYXyQAuqo6O85s8fAO1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: christian.koenig@amd.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 kraxel@redhat.com, tfiga@chromium.org, sam@ravnborg.org,
 m.szyprowski@samsung.com, corbet@lwn.net, linux-doc@vger.kernel.org,
 jonathanh@nvidia.com, matthew.auld@intel.com, linux+etnaviv@armlinux.org.uk,
 labbott@redhat.com, linux-media@vger.kernel.org, pawel@osciak.com,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, thomas.hellstrom@intel.com,
 rodrigo.vivi@intel.com, linux-tegra@vger.kernel.org, mchehab@kernel.org,
 lmark@codeaurora.org, afd@ti.com, kyungmin.park@samsung.com,
 robin.murphy@arm.com
Message-ID: <5ebffa27-4479-7487-bbc5-8230c8dbde91@suse.de>
Subject: Re: [PATCH v2 2/3] dma-buf: Use struct dma_buf_map in dma_buf_vmap()
 interfaces
References: <20200923123205.30671-1-tzimmermann@suse.de>
 <20200923123205.30671-3-tzimmermann@suse.de>
 <20200923153908.GT438822@phenom.ffwll.local>
In-Reply-To: <20200923153908.GT438822@phenom.ffwll.local>

--KIiFM399i8teHRQYXyQAuqo6O85s8fAO1
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 23.09.20 um 17:39 schrieb Daniel Vetter:
> On Wed, Sep 23, 2020 at 02:32:04PM +0200, Thomas Zimmermann wrote:
>> This patch updates dma_buf_vmap() and dma-buf's vmap callback to use
>> struct dma_buf_map.
>>
>> The interfaces used to return a buffer address. This address now gets
>> stored in an instance of the structure that is given as an additional
>> argument. The functions return an errno code on errors.
>>
>> Users of the functions are updated accordingly. This is only an interf=
ace
>> change. It is currently expected that dma-buf memory can be accessed w=
ith
>> system memory load/store operations.
>>
>> v2:
>> 	* always clear map parameter in dma_buf_vmap() (Daniel)
>> 	* include dma-buf-heaps and i915 selftests (kernel test robot)
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
>=20
> Too lazy to check for all possible conversion issues, but I think I've
> done a close look last time around. As long as this is build tested acr=
oss
> all drivers and architectures we care about we should be fine.

I built for x86-64, i586, aarch64 and arm. Apparently the kernel test
robot keeps digging up new build errors, so I'll double check before
committing. In any case, the errors should be trivial to fix.

Best regards
Thomas

>=20
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> ---
>>  drivers/dma-buf/dma-buf.c                     | 28 +++++++++++-------=
-
>>  drivers/dma-buf/heaps/heap-helpers.c          |  8 ++++--
>>  drivers/gpu/drm/drm_gem_cma_helper.c          | 13 +++++----
>>  drivers/gpu/drm/drm_gem_shmem_helper.c        | 14 ++++++----
>>  drivers/gpu/drm/drm_prime.c                   |  8 ++++--
>>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  8 +++++-
>>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    | 11 ++++++--
>>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  | 12 ++++++--
>>  .../gpu/drm/i915/gem/selftests/mock_dmabuf.c  | 10 +++++--
>>  drivers/gpu/drm/tegra/gem.c                   | 18 ++++++++----
>>  .../common/videobuf2/videobuf2-dma-contig.c   | 14 +++++++---
>>  .../media/common/videobuf2/videobuf2-dma-sg.c | 16 +++++++----
>>  .../common/videobuf2/videobuf2-vmalloc.c      | 15 +++++++---
>>  include/drm/drm_prime.h                       |  3 +-
>>  include/linux/dma-buf-map.h                   | 13 +++++++++
>>  include/linux/dma-buf.h                       |  6 ++--
>>  16 files changed, 138 insertions(+), 59 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index 5e849ca241a0..61bd24d21b38 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -1186,46 +1186,50 @@ EXPORT_SYMBOL_GPL(dma_buf_mmap);
>>   * dma_buf_vmap - Create virtual mapping for the buffer object into k=
ernel
>>   * address space. Same restrictions as for vmap and friends apply.
>>   * @dmabuf:	[in]	buffer to vmap
>> + * @map:	[out]	returns the vmap pointer
>>   *
>>   * This call may fail due to lack of virtual mapping address space.
>>   * These calls are optional in drivers. The intended use for them
>>   * is for mapping objects linear in kernel space for high use objects=
=2E
>>   * Please attempt to use kmap/kunmap before thinking about these inte=
rfaces.
>>   *
>> - * Returns NULL on error.
>> + * Returns 0 on success, or a negative errno code otherwise.
>>   */
>> -void *dma_buf_vmap(struct dma_buf *dmabuf)
>> +int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
>>  {
>> -	void *ptr;
>> +	struct dma_buf_map ptr;
>> +	int ret =3D 0;
>> +
>> +	dma_buf_map_clear(map);
>> =20
>>  	if (WARN_ON(!dmabuf))
>> -		return NULL;
>> +		return -EINVAL;
>> =20
>>  	if (!dmabuf->ops->vmap)
>> -		return NULL;
>> +		return -EINVAL;
>> =20
>>  	mutex_lock(&dmabuf->lock);
>>  	if (dmabuf->vmapping_counter) {
>>  		dmabuf->vmapping_counter++;
>>  		BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
>> -		ptr =3D dmabuf->vmap_ptr.vaddr;
>> +		*map =3D dmabuf->vmap_ptr;
>>  		goto out_unlock;
>>  	}
>> =20
>>  	BUG_ON(dma_buf_map_is_set(&dmabuf->vmap_ptr));
>> =20
>> -	ptr =3D dmabuf->ops->vmap(dmabuf);
>> -	if (WARN_ON_ONCE(IS_ERR(ptr)))
>> -		ptr =3D NULL;
>> -	if (!ptr)
>> +	ret =3D dmabuf->ops->vmap(dmabuf, &ptr);
>> +	if (WARN_ON_ONCE(ret))
>>  		goto out_unlock;
>> =20
>> -	dmabuf->vmap_ptr.vaddr =3D ptr;
>> +	dmabuf->vmap_ptr =3D ptr;
>>  	dmabuf->vmapping_counter =3D 1;
>> =20
>> +	*map =3D dmabuf->vmap_ptr;
>> +
>>  out_unlock:
>>  	mutex_unlock(&dmabuf->lock);
>> -	return ptr;
>> +	return ret;
>>  }
>>  EXPORT_SYMBOL_GPL(dma_buf_vmap);
>> =20
>> diff --git a/drivers/dma-buf/heaps/heap-helpers.c b/drivers/dma-buf/he=
aps/heap-helpers.c
>> index d0696cf937af..aeb9e100f339 100644
>> --- a/drivers/dma-buf/heaps/heap-helpers.c
>> +++ b/drivers/dma-buf/heaps/heap-helpers.c
>> @@ -235,7 +235,7 @@ static int dma_heap_dma_buf_end_cpu_access(struct =
dma_buf *dmabuf,
>>  	return 0;
>>  }
>> =20
>> -static void *dma_heap_dma_buf_vmap(struct dma_buf *dmabuf)
>> +static int dma_heap_dma_buf_vmap(struct dma_buf *dmabuf, struct dma_b=
uf_map *map)
>>  {
>>  	struct heap_helper_buffer *buffer =3D dmabuf->priv;
>>  	void *vaddr;
>> @@ -244,7 +244,11 @@ static void *dma_heap_dma_buf_vmap(struct dma_buf=
 *dmabuf)
>>  	vaddr =3D dma_heap_buffer_vmap_get(buffer);
>>  	mutex_unlock(&buffer->lock);
>> =20
>> -	return vaddr;
>> +	if (!vaddr)
>> +		return -ENOMEM;
>> +	dma_buf_map_set_vaddr(map, vaddr);
>> +
>> +	return 0;
>>  }
>> =20
>>  static void dma_heap_dma_buf_vunmap(struct dma_buf *dmabuf, void *vad=
dr)
>> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/dr=
m_gem_cma_helper.c
>> index 59b9ca207b42..1ece73fd3fe9 100644
>> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
>> @@ -617,22 +617,23 @@ drm_gem_cma_prime_import_sg_table_vmap(struct dr=
m_device *dev,
>>  {
>>  	struct drm_gem_cma_object *cma_obj;
>>  	struct drm_gem_object *obj;
>> -	void *vaddr;
>> +	struct dma_buf_map map;
>> +	int ret;
>> =20
>> -	vaddr =3D dma_buf_vmap(attach->dmabuf);
>> -	if (!vaddr) {
>> +	ret =3D dma_buf_vmap(attach->dmabuf, &map);
>> +	if (ret) {
>>  		DRM_ERROR("Failed to vmap PRIME buffer\n");
>> -		return ERR_PTR(-ENOMEM);
>> +		return ERR_PTR(ret);
>>  	}
>> =20
>>  	obj =3D drm_gem_cma_prime_import_sg_table(dev, attach, sgt);
>>  	if (IS_ERR(obj)) {
>> -		dma_buf_vunmap(attach->dmabuf, vaddr);
>> +		dma_buf_vunmap(attach->dmabuf, map.vaddr);
>>  		return obj;
>>  	}
>> =20
>>  	cma_obj =3D to_drm_gem_cma_obj(obj);
>> -	cma_obj->vaddr =3D vaddr;
>> +	cma_obj->vaddr =3D map.vaddr;
>> =20
>>  	return obj;
>>  }
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/=
drm_gem_shmem_helper.c
>> index d77c9f8ff26c..6328cfbb828e 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -261,13 +261,16 @@ EXPORT_SYMBOL(drm_gem_shmem_unpin);
>>  static void *drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *s=
hmem)
>>  {
>>  	struct drm_gem_object *obj =3D &shmem->base;
>> -	int ret;
>> +	struct dma_buf_map map;
>> +	int ret =3D 0;
>> =20
>>  	if (shmem->vmap_use_count++ > 0)
>>  		return shmem->vaddr;
>> =20
>>  	if (obj->import_attach) {
>> -		shmem->vaddr =3D dma_buf_vmap(obj->import_attach->dmabuf);
>> +		ret =3D dma_buf_vmap(obj->import_attach->dmabuf, &map);
>> +		if (!ret)
>> +			shmem->vaddr =3D map.vaddr;
>>  	} else {
>>  		pgprot_t prot =3D PAGE_KERNEL;
>> =20
>> @@ -279,11 +282,12 @@ static void *drm_gem_shmem_vmap_locked(struct dr=
m_gem_shmem_object *shmem)
>>  			prot =3D pgprot_writecombine(prot);
>>  		shmem->vaddr =3D vmap(shmem->pages, obj->size >> PAGE_SHIFT,
>>  				    VM_MAP, prot);
>> +		if (!shmem->vaddr)
>> +			ret =3D -ENOMEM;
>>  	}
>> =20
>> -	if (!shmem->vaddr) {
>> -		DRM_DEBUG_KMS("Failed to vmap pages\n");
>> -		ret =3D -ENOMEM;
>> +	if (ret) {
>> +		DRM_DEBUG_KMS("Failed to vmap pages, error %d\n", ret);
>>  		goto err_put_pages;
>>  	}
>> =20
>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c=

>> index 11fe9ff76fd5..2b3fd01867e4 100644
>> --- a/drivers/gpu/drm/drm_prime.c
>> +++ b/drivers/gpu/drm/drm_prime.c
>> @@ -669,16 +669,18 @@ EXPORT_SYMBOL(drm_gem_unmap_dma_buf);
>>   *
>>   * Returns the kernel virtual address or NULL on failure.
>>   */
>> -void *drm_gem_dmabuf_vmap(struct dma_buf *dma_buf)
>> +int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *=
map)
>>  {
>>  	struct drm_gem_object *obj =3D dma_buf->priv;
>>  	void *vaddr;
>> =20
>>  	vaddr =3D drm_gem_vmap(obj);
>>  	if (IS_ERR(vaddr))
>> -		vaddr =3D NULL;
>> +		return PTR_ERR(vaddr);
>> =20
>> -	return vaddr;
>> +	dma_buf_map_set_vaddr(map, vaddr);
>> +
>> +	return 0;
>>  }
>>  EXPORT_SYMBOL(drm_gem_dmabuf_vmap);
>> =20
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu=
/drm/etnaviv/etnaviv_gem_prime.c
>> index 4aa3426a9ba4..80a9fc143bbb 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
>> @@ -85,9 +85,15 @@ static void etnaviv_gem_prime_release(struct etnavi=
v_gem_object *etnaviv_obj)
>> =20
>>  static void *etnaviv_gem_prime_vmap_impl(struct etnaviv_gem_object *e=
tnaviv_obj)
>>  {
>> +	struct dma_buf_map map;
>> +	int ret;
>> +
>>  	lockdep_assert_held(&etnaviv_obj->lock);
>> =20
>> -	return dma_buf_vmap(etnaviv_obj->base.import_attach->dmabuf);
>> +	ret =3D dma_buf_vmap(etnaviv_obj->base.import_attach->dmabuf, &map);=

>> +	if (ret)
>> +		return NULL;
>> +	return map.vaddr;
>>  }
>> =20
>>  static int etnaviv_gem_prime_mmap_obj(struct etnaviv_gem_object *etna=
viv_obj,
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/=
drm/i915/gem/i915_gem_dmabuf.c
>> index 8dd295dbe241..6ee8f2cfd8c1 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> @@ -77,11 +77,18 @@ static void i915_gem_unmap_dma_buf(struct dma_buf_=
attachment *attachment,
>>  	i915_gem_object_unpin_pages(obj);
>>  }
>> =20
>> -static void *i915_gem_dmabuf_vmap(struct dma_buf *dma_buf)
>> +static int i915_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_b=
uf_map *map)
>>  {
>>  	struct drm_i915_gem_object *obj =3D dma_buf_to_obj(dma_buf);
>> +	void *vaddr;
>> =20
>> -	return i915_gem_object_pin_map(obj, I915_MAP_WB);
>> +	vaddr =3D i915_gem_object_pin_map(obj, I915_MAP_WB);
>> +	if (IS_ERR(vaddr))
>> +		return PTR_ERR(vaddr);
>> +
>> +	dma_buf_map_set_vaddr(map, vaddr);
>> +
>> +	return 0;
>>  }
>> =20
>>  static void i915_gem_dmabuf_vunmap(struct dma_buf *dma_buf, void *vad=
dr)
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/dr=
ivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>> index 2a52b92586b9..f79ebc5329b7 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>> @@ -82,6 +82,7 @@ static int igt_dmabuf_import(void *arg)
>>  	struct drm_i915_gem_object *obj;
>>  	struct dma_buf *dmabuf;
>>  	void *obj_map, *dma_map;
>> +	struct dma_buf_map map;
>>  	u32 pattern[] =3D { 0, 0xaa, 0xcc, 0x55, 0xff };
>>  	int err, i;
>> =20
>> @@ -110,7 +111,8 @@ static int igt_dmabuf_import(void *arg)
>>  		goto out_obj;
>>  	}
>> =20
>> -	dma_map =3D dma_buf_vmap(dmabuf);
>> +	err =3D dma_buf_vmap(dmabuf, &map);
>> +	dma_map =3D err ? NULL : map.vaddr;
>>  	if (!dma_map) {
>>  		pr_err("dma_buf_vmap failed\n");
>>  		err =3D -ENOMEM;
>> @@ -163,6 +165,7 @@ static int igt_dmabuf_import_ownership(void *arg)
>>  	struct drm_i915_private *i915 =3D arg;
>>  	struct drm_i915_gem_object *obj;
>>  	struct dma_buf *dmabuf;
>> +	struct dma_buf_map map;
>>  	void *ptr;
>>  	int err;
>> =20
>> @@ -170,7 +173,8 @@ static int igt_dmabuf_import_ownership(void *arg)
>>  	if (IS_ERR(dmabuf))
>>  		return PTR_ERR(dmabuf);
>> =20
>> -	ptr =3D dma_buf_vmap(dmabuf);
>> +	err =3D dma_buf_vmap(dmabuf, &map);
>> +	ptr =3D err ? NULL : map.vaddr;
>>  	if (!ptr) {
>>  		pr_err("dma_buf_vmap failed\n");
>>  		err =3D -ENOMEM;
>> @@ -212,6 +216,7 @@ static int igt_dmabuf_export_vmap(void *arg)
>>  	struct drm_i915_private *i915 =3D arg;
>>  	struct drm_i915_gem_object *obj;
>>  	struct dma_buf *dmabuf;
>> +	struct dma_buf_map map;
>>  	void *ptr;
>>  	int err;
>> =20
>> @@ -228,7 +233,8 @@ static int igt_dmabuf_export_vmap(void *arg)
>>  	}
>>  	i915_gem_object_put(obj);
>> =20
>> -	ptr =3D dma_buf_vmap(dmabuf);
>> +	err =3D dma_buf_vmap(dmabuf, &map);
>> +	ptr =3D err ? NULL : map.vaddr;
>>  	if (!ptr) {
>>  		pr_err("dma_buf_vmap failed\n");
>>  		err =3D -ENOMEM;
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c b/driver=
s/gpu/drm/i915/gem/selftests/mock_dmabuf.c
>> index be30b27e2926..becd9fb95d58 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
>> @@ -61,11 +61,17 @@ static void mock_dmabuf_release(struct dma_buf *dm=
a_buf)
>>  	kfree(mock);
>>  }
>> =20
>> -static void *mock_dmabuf_vmap(struct dma_buf *dma_buf)
>> +static int mock_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_m=
ap *map)
>>  {
>>  	struct mock_dmabuf *mock =3D to_mock(dma_buf);
>> +	void *vaddr;
>> =20
>> -	return vm_map_ram(mock->pages, mock->npages, 0);
>> +	vaddr =3D vm_map_ram(mock->pages, mock->npages, 0);
>> +	if (!vaddr)
>> +		return -ENOMEM;
>> +	dma_buf_map_set_vaddr(map, vaddr);
>> +
>> +	return 0;
>>  }
>> =20
>>  static void mock_dmabuf_vunmap(struct dma_buf *dma_buf, void *vaddr)
>> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c=

>> index a2bac20ff19d..6f04d7855f95 100644
>> --- a/drivers/gpu/drm/tegra/gem.c
>> +++ b/drivers/gpu/drm/tegra/gem.c
>> @@ -132,14 +132,18 @@ static void tegra_bo_unpin(struct device *dev, s=
truct sg_table *sgt)
>>  static void *tegra_bo_mmap(struct host1x_bo *bo)
>>  {
>>  	struct tegra_bo *obj =3D host1x_to_tegra_bo(bo);
>> +	struct dma_buf_map map;
>> +	int ret;
>> =20
>> -	if (obj->vaddr)
>> +	if (obj->vaddr) {
>>  		return obj->vaddr;
>> -	else if (obj->gem.import_attach)
>> -		return dma_buf_vmap(obj->gem.import_attach->dmabuf);
>> -	else
>> +	} else if (obj->gem.import_attach) {
>> +		ret =3D dma_buf_vmap(obj->gem.import_attach->dmabuf, &map);
>> +		return ret ? NULL : map.vaddr;
>> +	} else {
>>  		return vmap(obj->pages, obj->num_pages, VM_MAP,
>>  			    pgprot_writecombine(PAGE_KERNEL));
>> +	}
>>  }
>> =20
>>  static void tegra_bo_munmap(struct host1x_bo *bo, void *addr)
>> @@ -634,12 +638,14 @@ static int tegra_gem_prime_mmap(struct dma_buf *=
buf, struct vm_area_struct *vma)
>>  	return __tegra_gem_mmap(gem, vma);
>>  }
>> =20
>> -static void *tegra_gem_prime_vmap(struct dma_buf *buf)
>> +static int tegra_gem_prime_vmap(struct dma_buf *buf, struct dma_buf_m=
ap *map)
>>  {
>>  	struct drm_gem_object *gem =3D buf->priv;
>>  	struct tegra_bo *bo =3D to_tegra_bo(gem);
>> =20
>> -	return bo->vaddr;
>> +	dma_buf_map_set_vaddr(map, bo->vaddr);
>> +
>> +	return 0;
>>  }
>> =20
>>  static void tegra_gem_prime_vunmap(struct dma_buf *buf, void *vaddr)
>> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/d=
rivers/media/common/videobuf2/videobuf2-dma-contig.c
>> index ec3446cc45b8..11428287bdf3 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> @@ -81,9 +81,13 @@ static void *vb2_dc_cookie(void *buf_priv)
>>  static void *vb2_dc_vaddr(void *buf_priv)
>>  {
>>  	struct vb2_dc_buf *buf =3D buf_priv;
>> +	struct dma_buf_map map;
>> +	int ret;
>> =20
>> -	if (!buf->vaddr && buf->db_attach)
>> -		buf->vaddr =3D dma_buf_vmap(buf->db_attach->dmabuf);
>> +	if (!buf->vaddr && buf->db_attach) {
>> +		ret =3D dma_buf_vmap(buf->db_attach->dmabuf, &map);
>> +		buf->vaddr =3D ret ? NULL : map.vaddr;
>> +	}
>> =20
>>  	return buf->vaddr;
>>  }
>> @@ -365,11 +369,13 @@ vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf =
*dbuf,
>>  	return 0;
>>  }
>> =20
>> -static void *vb2_dc_dmabuf_ops_vmap(struct dma_buf *dbuf)
>> +static int vb2_dc_dmabuf_ops_vmap(struct dma_buf *dbuf, struct dma_bu=
f_map *map)
>>  {
>>  	struct vb2_dc_buf *buf =3D dbuf->priv;
>> =20
>> -	return buf->vaddr;
>> +	dma_buf_map_set_vaddr(map, buf->vaddr);
>> +
>> +	return 0;
>>  }
>> =20
>>  static int vb2_dc_dmabuf_ops_mmap(struct dma_buf *dbuf,
>> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drive=
rs/media/common/videobuf2/videobuf2-dma-sg.c
>> index 0a40e00f0d7e..c51170e9c1b9 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
>> @@ -300,14 +300,18 @@ static void vb2_dma_sg_put_userptr(void *buf_pri=
v)
>>  static void *vb2_dma_sg_vaddr(void *buf_priv)
>>  {
>>  	struct vb2_dma_sg_buf *buf =3D buf_priv;
>> +	struct dma_buf_map map;
>> +	int ret;
>> =20
>>  	BUG_ON(!buf);
>> =20
>>  	if (!buf->vaddr) {
>> -		if (buf->db_attach)
>> -			buf->vaddr =3D dma_buf_vmap(buf->db_attach->dmabuf);
>> -		else
>> +		if (buf->db_attach) {
>> +			ret =3D dma_buf_vmap(buf->db_attach->dmabuf, &map);
>> +			buf->vaddr =3D ret ? NULL : map.vaddr;
>> +		} else {
>>  			buf->vaddr =3D vm_map_ram(buf->pages, buf->num_pages, -1);
>> +		}
>>  	}
>> =20
>>  	/* add offset in case userptr is not page-aligned */
>> @@ -489,11 +493,13 @@ vb2_dma_sg_dmabuf_ops_end_cpu_access(struct dma_=
buf *dbuf,
>>  	return 0;
>>  }
>> =20
>> -static void *vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf)
>> +static int vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf, struct dm=
a_buf_map *map)
>>  {
>>  	struct vb2_dma_sg_buf *buf =3D dbuf->priv;
>> =20
>> -	return vb2_dma_sg_vaddr(buf);
>> +	dma_buf_map_set_vaddr(map, buf->vaddr);
>> +
>> +	return 0;
>>  }
>> =20
>>  static int vb2_dma_sg_dmabuf_ops_mmap(struct dma_buf *dbuf,
>> diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/driv=
ers/media/common/videobuf2/videobuf2-vmalloc.c
>> index c66fda4a65e4..7b68e2379c65 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
>> @@ -318,11 +318,13 @@ static void vb2_vmalloc_dmabuf_ops_release(struc=
t dma_buf *dbuf)
>>  	vb2_vmalloc_put(dbuf->priv);
>>  }
>> =20
>> -static void *vb2_vmalloc_dmabuf_ops_vmap(struct dma_buf *dbuf)
>> +static int vb2_vmalloc_dmabuf_ops_vmap(struct dma_buf *dbuf, struct d=
ma_buf_map *map)
>>  {
>>  	struct vb2_vmalloc_buf *buf =3D dbuf->priv;
>> =20
>> -	return buf->vaddr;
>> +	dma_buf_map_set_vaddr(map, buf->vaddr);
>> +
>> +	return 0;
>>  }
>> =20
>>  static int vb2_vmalloc_dmabuf_ops_mmap(struct dma_buf *dbuf,
>> @@ -374,10 +376,15 @@ static struct dma_buf *vb2_vmalloc_get_dmabuf(vo=
id *buf_priv, unsigned long flag
>>  static int vb2_vmalloc_map_dmabuf(void *mem_priv)
>>  {
>>  	struct vb2_vmalloc_buf *buf =3D mem_priv;
>> +	struct dma_buf_map map;
>> +	int ret;
>> =20
>> -	buf->vaddr =3D dma_buf_vmap(buf->dbuf);
>> +	ret =3D dma_buf_vmap(buf->dbuf, &map);
>> +	if (ret)
>> +		return -EFAULT;
>> +	buf->vaddr =3D map.vaddr;
>> =20
>> -	return buf->vaddr ? 0 : -EFAULT;
>> +	return 0;
>>  }
>> =20
>>  static void vb2_vmalloc_unmap_dmabuf(void *mem_priv)
>> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
>> index 0f69f9fbf12c..5125f84c28f6 100644
>> --- a/include/drm/drm_prime.h
>> +++ b/include/drm/drm_prime.h
>> @@ -54,6 +54,7 @@ struct device;
>>  struct dma_buf_export_info;
>>  struct dma_buf;
>>  struct dma_buf_attachment;
>> +struct dma_buf_map;
>> =20
>>  enum dma_data_direction;
>> =20
>> @@ -82,7 +83,7 @@ struct sg_table *drm_gem_map_dma_buf(struct dma_buf_=
attachment *attach,
>>  void drm_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
>>  			   struct sg_table *sgt,
>>  			   enum dma_data_direction dir);
>> -void *drm_gem_dmabuf_vmap(struct dma_buf *dma_buf);
>> +int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *=
map);
>>  void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, void *vaddr);
>> =20
>>  int drm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_str=
uct *vma);
>> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h=

>> index d4b1bb3cc4b0..6b4f6e0e8b5d 100644
>> --- a/include/linux/dma-buf-map.h
>> +++ b/include/linux/dma-buf-map.h
>> @@ -28,6 +28,19 @@ struct dma_buf_map {
>>  	bool is_iomem;
>>  };
>> =20
>> +/**
>> + * dma_buf_map_set_vaddr - Sets a dma-buf mapping structure to an add=
ress in system memory
>> + * @map:	The dma-buf mapping structure
>> + * @vaddr:	A system-memory address
>> + *
>> + * Sets the address and clears the I/O-memory flag.
>> + */
>> +static inline void dma_buf_map_set_vaddr(struct dma_buf_map *map, voi=
d *vaddr)
>> +{
>> +	map->vaddr =3D vaddr;
>> +	map->is_iomem =3D false;
>> +}
>> +
>>  /* API transition helper */
>>  static inline bool dma_buf_map_is_vaddr(const struct dma_buf_map *map=
, const void *vaddr)
>>  {
>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>> index fcc2ddfb6d18..7237997cfa38 100644
>> --- a/include/linux/dma-buf.h
>> +++ b/include/linux/dma-buf.h
>> @@ -266,7 +266,7 @@ struct dma_buf_ops {
>>  	 */
>>  	int (*mmap)(struct dma_buf *, struct vm_area_struct *vma);
>> =20
>> -	void *(*vmap)(struct dma_buf *);
>> +	int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
>>  	void (*vunmap)(struct dma_buf *, void *vaddr);
>>  };
>> =20
>> @@ -503,6 +503,6 @@ int dma_buf_end_cpu_access(struct dma_buf *dma_buf=
,
>> =20
>>  int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
>>  		 unsigned long);
>> -void *dma_buf_vmap(struct dma_buf *);
>> -void dma_buf_vunmap(struct dma_buf *, void *vaddr);
>> +int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
>> +void dma_buf_vunmap(struct dma_buf *dmabuf, void *vaddr);
>>  #endif /* __DMA_BUF_H__ */
>> --=20
>> 2.28.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--KIiFM399i8teHRQYXyQAuqo6O85s8fAO1--

--0PDgmugOtYTKuFhKgfUTndpr73KvkO8XC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9sR1IUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiNTzgf/VhLUkn8nUhcYMli73b9AHPIjKBw0
JUhQ6yG/jiyVHgyHf6NVfRxlg+dOdJSYnmKbk3vcq371PSAC6E2pDnq9lwTTDISf
LzjCEsmZQIeVvhoAnAOyOxW6HnBCm8Wrkoi/FvioqchPG6ggGTAUUKZTP2cWrHbr
4F/g9MntcrbGI7yv01vlZaepXeRTRfrPuEIVGBfoLh5z1WetRC7+pWF0zicsKNnH
am0FHe4GZJ7mhCfGr33H4rhGqthklnAVLviVnI8Q4PnBd+YNG45wMhALVD0xoPfv
Kc6XxyTXN8LsgtLJEedrlzQ57W+3LsBgcJv1Qn59QATvkl8X/mK2OXcGdA==
=hV25
-----END PGP SIGNATURE-----

--0PDgmugOtYTKuFhKgfUTndpr73KvkO8XC--
