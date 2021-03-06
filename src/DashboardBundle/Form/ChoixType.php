<?php

namespace DashboardBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;

class ChoixType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('content','text',array('label' => 'Question :'))
            ->add('reponse','choice',array(
                'choices' => array('oui' => 'oui', 'non' => 'non'),
                'expanded'  => true,
                'required' => true,
            ))
            ->add('note','number',array('empty_data'=>'2'))
        ;
    }
    
    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'DashboardBundle\Entity\Choix'
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 'dashboardbundle_choix';
    }
}
